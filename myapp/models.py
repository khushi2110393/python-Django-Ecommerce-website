from django.contrib.auth.models import AbstractUser
from django.db import models
from django.conf import settings
from django.contrib.auth import get_user_model

# Role Model
class Role(models.Model):
    role_name = models.CharField(max_length=10, unique=True)
    
    def __str__(self):
        return self.role_name

# Area Model
class Area(models.Model):
    area_name = models.CharField(max_length=15, unique=True)
    
    def __str__(self):
        return self.area_name

# Custom User Model
class CustomUser(AbstractUser):
    email = models.EmailField(unique=True, max_length=255)
    username = models.CharField(max_length=150, unique=False)  # 👈 Username को unique=False किया गया
    contact_no = models.CharField(max_length=15, blank=True, null=True)
    address = models.CharField(max_length=100, blank=True, null=True)
    area = models.ForeignKey(Area, on_delete=models.SET_NULL, null=True, blank=True)
    gender = models.CharField(
        max_length=10, 
        choices=[('Male', 'Male'), ('Female', 'Female'), ('Other', 'Other')], 
        blank=True, null=True
    )
    role = models.ForeignKey(Role, on_delete=models.SET_NULL, null=True, blank=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    def __str__(self):
        return self.email

class Category(models.Model):
    category_id = models.AutoField(primary_key=True)  # Custom Primary Key
    category_name = models.CharField(max_length=15, unique=True)

    def __str__(self):
        return self.category_name

# Brand Model
class Brand(models.Model):
    brand_name = models.CharField(max_length=50, unique=True)
    
    def __str__(self):
        return self.brand_name

# Unit Model
class Unit(models.Model):
    unit_name = models.CharField(max_length=50, unique=True)
    
    def __str__(self):
        return self.unit_name

class Product(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, to_field="category_id")  # Update this line
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    unit = models.ForeignKey(Unit, on_delete=models.CASCADE)
    p_name = models.CharField(max_length=500)
    p_price = models.DecimalField(max_digits=10, decimal_places=2)
    p_description = models.TextField(blank=True, null=True)
    p_img = models.ImageField(upload_to='products/', blank=True, null=True)
    p_qty = models.PositiveIntegerField()

    def __str__(self):
        return self.p_name
# Cart Model
class Cart(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def total_items(self):
        return self.cart_items.count()

    def total_price(self):
        return sum(item.total_price for item in self.cart_items.all())

    def __str__(self):
        return f"Cart of {self.user.username}"

# CartItem Model
class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE, related_name='cart_items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    added_at = models.DateTimeField(auto_now_add=True)

    def save(self, *args, **kwargs):
        if self.price is None:
            self.price = self.product.p_price
        super().save(*args, **kwargs)

    @property
    def total_price(self):
        return self.quantity * (self.price or 0)

    def __str__(self):
        return f"{self.cart.user.username} - {self.product.p_name} ({self.quantity})"

# Order Model
class Order(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    order_date = models.DateTimeField(auto_now_add=True)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    payment_status = models.CharField(
        max_length=15, 
        choices=[('Pending', 'Pending'), ('Completed', 'Completed'), ('Failed', 'Failed')], 
        default='Pending'
    )
    status = models.CharField(
        max_length=15, 
        choices=[('Processing', 'Processing'), ('Shipped', 'Shipped'), ('Delivered', 'Delivered'), ('Cancelled', 'Cancelled')], 
        default='Processing'
    )

    def calculate_total(self):
        """Calculate the total amount only if order has an ID (is saved)."""
        if self.pk:  # Pehle check karo ki Order database me save ho chuka hai
            total = sum(item.quantity * item.price for item in self.order_items.all())
            self.total_amount = total  

    def save(self, *args, **kwargs):
        self.calculate_total()  # Order ka total update karo
        super().save(*args, **kwargs)  # Order ko save karo

    def __str__(self):
        return f"Order {self.id} by {self.user.username}"

# OrderItem Model
class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="order_items")
    product = models.ForeignKey("Product", on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    def save(self, *args, **kwargs):
        """Ensure price is set, then save OrderItem, and update order total."""
        if not self.price:
            self.price = self.product.p_price  # Default price from product
        
        super().save(*args, **kwargs)  # Pehle OrderItem save karo
        
        if self.order.pk:  # Order already saved hai to total update karo
            self.order.calculate_total()
            self.order.save(update_fields=['total_amount'])

    def __str__(self):
        return f"{self.product.p_name} - {self.quantity}"

# Address Model
class Address(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name="addresses")
    full_address = models.TextField()
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    pincode = models.CharField(max_length=10)
    is_default = models.BooleanField(default=False)
    
    def __str__(self):
        return f"{self.user.username} - {self.city}"

# Payment Model
class Payment(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    payment_id = models.CharField(max_length=100, unique=True)
    amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)  # ✅ Missing Amount Field Added
    payment_status = models.CharField(
        max_length=20, 
        choices=[('Pending', 'Pending'), ('Completed', 'Completed'), ('Failed', 'Failed')], 
        default="Pending"
    )
    payment_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Payment {self.payment_id} - {self.payment_status}"

# Wishlist Model
class Wishlist(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)  # ✅ Product को Direct लिया
    added_on = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.product.p_name}"