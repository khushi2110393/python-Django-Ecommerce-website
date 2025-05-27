from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import index, wishlist, add_to_wishlist  # नए views को इम्पोर्ट करें
from .views import index
from django.views.generic import RedirectView
from myapp import views
from .views import place_order, order_success
from .views import initiate_payment
from .views import payment_callback

urlpatterns = [
    # Admin Panel
    path('admin/', admin.site.urls),

    # Redirect to Register Page
    path('', RedirectView.as_view(url='/register/', permanent=False), name='root_redirect'),

    # Authentication URLs
    path('register/', views.register, name='register'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),

    # Index Page (Login Required)
    path('index/', views.index, name='index'),

    # Shop & Product Pages
   path('search/', views.search, name='search'),  # Search view ke liye URL
    path('shop/', views.shop, name='shop'),
    path('shop_cart/', views.shop_cart, name='shop_cart'),
    path('product_details/<int:product_id>/', views.product_details, name='product_details'),
   path('wishlist/', views.wishlist, name='wishlist'),  # विशलिस्ट आइटम्स दिखाने के लिए
    path('add-to-wishlist/<int:product_id>/', views.add_to_wishlist, name='add_to_wishlist'),  # प्रोडक्ट को विशलिस्ट में जोड़ने के लिए
    path('wishlist/remove/<int:item_id>/', views.remove_from_wishlist, name='remove_from_wishlist'),
    path('add-to-cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('remove-from-cart/<int:item_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('update_cart/<int:item_id>/', views.update_cart, name='update_cart'),

    # Blog Pages
    path('blog/', views.blog, name='blog'),
    path('blog-details/', views.blog_details, name='blog_details'),

    # Checkout & Contact
    # Checkout Page
    path('checkout/', views.checkout, name='checkout'),

    # Place Order Action
    path('place_order/', place_order, name='place_order'),
    path('payment/initiate/<int:order_id>/', initiate_payment, name='initiate_payment'),
    path('payment/callback/', payment_callback, name='payment_callback'),
    path('order_success/', order_success, name='order_success'),
    path('contact/', views.contact_view, name='contact'),
      path('success/', views.success_view, name='success_url'),  # Success page ka URL

    # Extra Pages (Category Wise)
    path('accessories/', views.accessories, name='accessories'),
    path('all-product/', views.all_product, name='all-product'),
    path('eyes/', views.eyes_view, name='eyes'),
    path('face/', views.face_view, name='face'),
    path('facial/', views.facial, name='facial'),
    path('hair/', views.hair_view, name='hair'),
    path('lips/', views.lips_view, name='lips'),
    path('nails/', views.nails_view, name='nails'),
    
]

# Static Files Configuration (For Media)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)