

import razorpay

from django.conf import settings
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import RegisterForm
from .models import Cart, CartItem, Product, Wishlist, Order, OrderItem
from django.http import JsonResponse
from .models import  Category
from .forms import ContactForm
from .models import  Payment
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from django.db.models import Q  # For complex queries




@login_required
def index(request):
    cart = Cart.objects.filter(user=request.user).first()
    cart_count = cart.cart_items.count() if cart else 0
    wishlist_count = Wishlist.objects.filter(user=request.user).count()
    products = Product.objects.all()

    return render(request, "index.html", {
        "username": request.user.username,
        "cart_count": cart_count,
        "wishlist_count": wishlist_count,
        "products": products
    })

@login_required
def add_to_cart(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart, created = Cart.objects.get_or_create(user=request.user)
    cart_item, created = CartItem.objects.get_or_create(cart=cart, product=product)

    if not created:
        cart_item.quantity += 1
    else:
        cart_item.quantity = 1

    cart_item.save()
    return redirect("shop_cart")

@login_required
def wishlist(request):
    wishlist_items = Wishlist.objects.filter(user=request.user)
    return render(request, 'wishlist.html', {
        "wishlist_items": wishlist_items,
        "wishlist_count": wishlist_items.count()
    })

@login_required
def add_to_wishlist(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    Wishlist.objects.get_or_create(user=request.user, product=product)
    return redirect("wishlist")

@login_required
def remove_from_wishlist(request, item_id):
    wishlist_item = get_object_or_404(Wishlist, id=item_id, user=request.user)
    wishlist_item.delete()
    return redirect('wishlist')

def register(request):
    if request.user.is_authenticated:
        return redirect("index")

    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.username = user.email.split("@")[0]
            user.save()
            messages.success(request, "Registration successful! Please login.")
            return redirect("login")
        else:
            messages.error(request, "Registration failed! Please correct the errors.")
    else:
        form = RegisterForm()

    return render(request, "register.html", {"form": form})

def login_view(request):
    if request.user.is_authenticated:
        return redirect("index")

    if request.method == "POST":
        email = request.POST.get("email")
        password = request.POST.get("password")

        user = authenticate(request, username=email, password=password)

        if user is not None:
            login(request, user)
            return redirect("index")
        else:
            messages.error(request, "Invalid email or password!")
    return render(request, "login.html")

def logout_view(request):
    logout(request)
    messages.success(request, "You have been logged out.")
    return redirect("login")

def product_details(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    return render(request, 'product_details.html', {'product': product})




def shop(request):
    products = Product.objects.all()  # Fetch all products
    return render(request, 'shop.html', {'products': products})


def search(request):
    # Get the search query from the URL parameter 'q'
    query = request.GET.get('q')
    
    # If there's a query, filter products by name (case-insensitive)
    if query:
        products = Product.objects.filter(Q(name__icontains=query))
    else:
        # If no query, return an empty queryset
        products = Product.objects.none()
    
    # Pass the products and query to the template
    return render(request, 'search.html', {
        'products': products,
        'query': query
    })



@login_required
def shop_cart(request):
    cart, created = Cart.objects.get_or_create(user=request.user)
    cart_items = cart.cart_items.all()
    total_price = cart.total_price()
    cart_count = cart.cart_items.count()

    return render(request, 'shop_cart.html', {
        'cart_items': cart_items,
        'cart': cart,
        'total_price': total_price,
        'cart_count': cart_count
    })

@login_required
def remove_from_cart(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    cart_item.delete()
    return redirect('shop_cart')

@login_required
def update_cart(request, item_id):
    if request.method == 'POST':
        cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
        quantity = int(request.POST.get('quantity', 1))
        cart_item.quantity = quantity
        cart_item.price = cart_item.product.p_price
        cart_item.save()

        cart = cart_item.cart
        subtotal = cart.total_price()
        total = subtotal

        return JsonResponse({
            'success': True,
            'subtotal': subtotal,
            'total': total
        })
    return JsonResponse({'success': False})

def blog(request):
    return render(request, 'blog.html')

def blog_details(request):
    return render(request, 'blog-details.html')

@login_required
def checkout(request):
    cart = Cart.objects.filter(user=request.user).first()
    if not cart or not cart.cart_items.exists():
        messages.error(request, "Your cart is empty. Please add items to proceed.")
        return redirect("shop")

    cart_items = CartItem.objects.filter(cart=cart)
    cart_subtotal = sum(item.total_price for item in cart_items)
    cart_total = cart_subtotal

    context = {
        'cart_items': cart_items,
        'cart_subtotal': cart_subtotal,
        'cart_total': cart_total,
    }
    return render(request, 'checkout.html', context)

@login_required
def place_order(request):
    if request.method == 'POST':
        cart = Cart.objects.filter(user=request.user).first()
        if not cart or not cart.cart_items.exists():
            messages.error(request, "Your cart is empty.")
            return redirect("checkout")

        total_price = sum(item.total_price for item in cart.cart_items.all())

        order = Order.objects.create(
            user=request.user,
            total_amount=total_price,
        )

        for cart_item in cart.cart_items.all():
            OrderItem.objects.create(
                order=order,
                product=cart_item.product,
                quantity=cart_item.quantity,
                price=cart_item.price,
            )

        cart.cart_items.all().delete()
       # Redirect to payment page
        return redirect('initiate_payment', order_id=order.id)

    return redirect('checkout')



@login_required
def initiate_payment(request, order_id):
    # Get the order
    order = get_object_or_404(Order, id=order_id, user=request.user)

    # Convert amount to paise (Razorpay expects amount in paise)
    amount_in_paise = int(order.total_amount * 100)

    # Initialize Razorpay client
    client = razorpay.Client(auth=(settings.RAZORPAY_KEY_ID, settings.RAZORPAY_KEY_SECRET))

    # Create payment data
    payment_data = {
        'amount': amount_in_paise,  # Use the calculated value
        'currency': 'INR',
        'receipt': f'order_{order.id}',
        'payment_capture': '1'  # Auto-capture payment
    }

    try:
        # Create Razorpay order
        razorpay_order = client.order.create(data=payment_data)
    except Exception as e:
        # Handle Razorpay API errors
        return HttpResponse(f"Razorpay API Error: {str(e)}")

    # Save payment details in your database
    payment = Payment.objects.create(
        user=request.user,
        order=order,
        payment_id=razorpay_order['id'],
        amount=order.total_amount,
        payment_status='Pending'
    )

    # Context for rendering the payment page
    context = {
        'order': order,
        'razorpay_order_id': razorpay_order['id'],
        'razorpay_key_id': settings.RAZORPAY_KEY_ID,
        'amount_in_paise': amount_in_paise,  # Pass the calculated value
        'total_amount': order.total_amount,  # Pass total amount
        'currency': 'INR',
        'callback_url': 'http://127.0.0.1:8000/payment/callback/'  # Update this URL
    }

    return render(request, 'payment.html', context)



@csrf_exempt
def payment_callback(request):
    if request.method == "POST":
        razorpay_payment_id = request.POST.get('razorpay_payment_id')
        razorpay_order_id = request.POST.get('razorpay_order_id')
        razorpay_signature = request.POST.get('razorpay_signature')

        client = razorpay.Client(auth=(settings.RAZORPAY_KEY_ID, settings.RAZORPAY_KEY_SECRET))

        params_dict = {
            'razorpay_order_id': razorpay_order_id,
            'razorpay_payment_id': razorpay_payment_id,
            'razorpay_signature': razorpay_signature
        }

        try:
            # Verify payment signature
            client.utility.verify_payment_signature(params_dict)
            
            # Update payment status in your database
            payment = Payment.objects.get(payment_id=razorpay_order_id)
          
            payment.payment_status = 'Completed'
            payment.razorpay_payment_id = razorpay_payment_id  # Save payment ID
            payment.save()

             # Update the associated order status
            order = payment.order
            order.payment_status = 'Completed'
            
            # Only update order status to Processing if it's still Pending
            if order.status == 'Pending':
                order.status = 'Processing'
            
            order.save()

            # Fetch order details
            order = Order.objects.get(id=payment.order.id)

            # Redirect to order success page
            return redirect('order_success')
        except razorpay.errors.SignatureVerificationError as e:
            # Handle signature verification error
            print(f"Signature Verification Error: {str(e)}")
            return HttpResponse("Payment verification failed! Invalid signature.")
        except Payment.DoesNotExist:
            # Handle case where payment record does not exist
            return HttpResponse("Payment record not found! Please contact support.")
        except Exception as e:
            # Handle any other exceptions
            print(f"Unexpected Error: {str(e)}")
            return HttpResponse("An error occurred while processing your payment. Please try again later.")
    else:
        # Handle invalid request methods
        return HttpResponse("Invalid request method! Only POST requests are allowed.", status=405)
    

   

@login_required
def order_success(request):
    order = Order.objects.filter(user=request.user).order_by('-order_date').first()
    payment = Payment.objects.filter(order=order).first()
    return render(request, 'order_success.html', {'order': order, 'payment': payment})

def contact_view(request):
    # Contact information (can be dynamic or hardcoded)
    contact_info = {
        'address': 'Shop No. 6, Nandanvan Park, Nr. Badrinarayan Soc Thakkarnagar Road, Ahmedabad-382350, Ahmedabad, India 382350',
        'phone': ['919276813683'],
        'support_email': 'Support.vaibhavop2402@gmail.com',
    }

    # Instagram posts (can be dynamic or hardcoded)
    instagram_posts = [
        {'image': 'img/instagram/insta-1.jpg', 'link': '#'},
        {'image': 'img/instagram/insta-2.jpg', 'link': '#'},
        {'image': 'img/instagram/insta-3.jpg', 'link': '#'},
        {'image': 'img/instagram/insta-4.jpg', 'link': '#'},
        {'image': 'img/instagram/insta-5.jpg', 'link': '#'},
        {'image': 'img/instagram/insta-6.jpg', 'link': '#'},
    ]

    # Footer links (can be dynamic or hardcoded)
    footer_links = {
        'quick_links': [
            {'name': 'About', 'url': '#'},
            {'name': 'Blogs', 'url': '{% url "blog" %}'},
            {'name': 'Contact', 'url': '{% url "contact" %}'},
            {'name': 'FAQ', 'url': '#'},
        ],
        'account_links': [
            {'name': 'My Account', 'url': '#'},
            {'name': 'Orders Tracking', 'url': '#'},
            {'name': 'Checkout', 'url': '#'},
            {'name': 'Wishlist', 'url': '#'},
        ],
    }

    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            # Process the data (e.g., send an email or save to the database)
            print(form.cleaned_data)  # For debugging
            return redirect('success_url')  # Redirect to a success page
    else:
        form = ContactForm()

    # Pass all data to the template
    context = {
        'form': form,
        'contact_info': contact_info,
        'instagram_posts': instagram_posts,
        'footer_links': footer_links,
    }
    return render(request, 'contact.html', context)

def success_view(request):
    return render(request, 'success.html')  # success.html template render karega

def accessories(request):
    return render(request, 'accessories.html')

def all_product(request):
    return render(request, 'all-product.html')



def face_view(request):
    face_products = Product.objects.filter(category__category_name__iexact="face")

    context = {
        "face_products": face_products,
    }
    return render(request, "face.html", context)

def eyes_view(request):
    eyes_products = Product.objects.filter(category__category_name__iexact="eyes")

    context = {
        "eyes_products": eyes_products,
    }
    return render(request, "eyes.html", context)


def facial(request):
    return render(request, 'facial.html')

def hair_view(request):
    hair_products = Product.objects.filter(category__category_name__iexact="hair")

    context = {
        "hair_products": hair_products,
    }
    return render(request, "hair.html", context)

def lips_view(request):
    lips_products = Product.objects.filter(category__category_name__iexact="lips")

    context = {
        "lips_products": lips_products,
    }
    return render(request, "lips.html", context)

def nails_view(request):
    nails_products = Product.objects.filter(category__category_name__iexact="nails")

    context = {
        "nails_products": nails_products,
    }
    return render(request, "nails.html", context)

