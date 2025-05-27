from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.http import HttpResponse
from django.urls import reverse
from django.utils.html import format_html
from io import BytesIO
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
from .models import *
from django.db.models import Sum, Count
from datetime import datetime, timedelta
import csv

# Common PDF generation function
def generate_pdf(title, headers, data):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="{title}.pdf"'
    
    buffer = BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=letter)
    elements = []
    
    styles = getSampleStyleSheet()
    elements.append(Paragraph(title, styles['Title']))
    
    # Create table data
    table_data = [headers]
    for row in data:
        table_data.append(row)
    
    # Create table
    table = Table(table_data)
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, 0), 12),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
        ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
    ]))
    
    elements.append(table)
    doc.build(elements)
    
    pdf = buffer.getvalue()
    buffer.close()
    response.write(pdf)
    return response

# Common CSV generation function
def generate_csv(title, headers, data):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = f'attachment; filename="{title}.csv"'
    
    writer = csv.writer(response)
    writer.writerow(headers)
    for row in data:
        writer.writerow(row)
    
    return response

# ✅ Custom User Admin
class CustomUserAdmin(UserAdmin):
    model = CustomUser
    list_display = ('username', 'email', 'contact_no', 'address', 'area', 'gender', 'role', 'is_staff', 'is_active')
    list_filter = ('is_staff', 'is_active', 'role', 'area')
    actions = ['export_users_pdf', 'export_users_csv']

    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal Info', {'fields': ('username', 'contact_no', 'address', 'area', 'gender', 'role')}),
        ('Permissions', {'fields': ('is_staff', 'is_active', 'groups', 'user_permissions')}),
        ('Important Dates', {'fields': ('last_login', 'date_joined')}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'password1', 'password2', 'is_staff', 'is_active'),
        }),
    )

    search_fields = ('username', 'email', 'contact_no')
    ordering = ('email',)
    
    def export_users_pdf(self, request, queryset):
        headers = ['Username', 'Email', 'Contact No', 'Address', 'Area', 'Gender', 'Role', 'Staff', 'Active']
        data = []
        for user in queryset:
            data.append([
                user.username,
                user.email,
                user.contact_no or '-',
                user.address or '-',
                str(user.area) if user.area else '-',
                user.gender or '-',
                str(user.role) if user.role else '-',
                'Yes' if user.is_staff else 'No',
                'Yes' if user.is_active else 'No'
            ])
        return generate_pdf('Users_Report', headers, data)
    export_users_pdf.short_description = "Export selected users to PDF"
    
    def export_users_csv(self, request, queryset):
        headers = ['Username', 'Email', 'Contact No', 'Address', 'Area', 'Gender', 'Role', 'Staff', 'Active']
        data = []
        for user in queryset:
            data.append([
                user.username,
                user.email,
                user.contact_no or '-',
                user.address or '-',
                str(user.area) if user.area else '-',
                user.gender or '-',
                str(user.role) if user.role else '-',
                'Yes' if user.is_staff else 'No',
                'Yes' if user.is_active else 'No'
            ])
        return generate_csv('Users_Report', headers, data)
    export_users_csv.short_description = "Export selected users to CSV"

# ✅ Role Model Admin
class RoleAdmin(admin.ModelAdmin):
    search_fields = ('role_name',)
    list_display = ('role_name',)
    actions = ['export_roles_pdf', 'export_roles_csv']
    
    def export_roles_pdf(self, request, queryset):
        headers = ['Role Name']
        data = [[role.role_name] for role in queryset]
        return generate_pdf('Roles_Report', headers, data)
    export_roles_pdf.short_description = "Export selected roles to PDF"
    
    def export_roles_csv(self, request, queryset):
        headers = ['Role Name']
        data = [[role.role_name] for role in queryset]
        return generate_csv('Roles_Report', headers, data)
    export_roles_csv.short_description = "Export selected roles to CSV"

# ✅ Area Model Admin
class AreaAdmin(admin.ModelAdmin):
    search_fields = ('area_name',)
    list_display = ('area_name',)
    actions = ['export_areas_pdf', 'export_areas_csv']
    
    def export_areas_pdf(self, request, queryset):
        headers = ['Area Name']
        data = [[area.area_name] for area in queryset]
        return generate_pdf('Areas_Report', headers, data)
    export_areas_pdf.short_description = "Export selected areas to PDF"
    
    def export_areas_csv(self, request, queryset):
        headers = ['Area Name']
        data = [[area.area_name] for area in queryset]
        return generate_csv('Areas_Report', headers, data)
    export_areas_csv.short_description = "Export selected areas to CSV"

class CategoryAdmin(admin.ModelAdmin):
    search_fields = ('category_name',)
    list_display = ('__str__',)
    list_per_page = 20
    actions = ['export_categories_pdf', 'export_categories_csv']
    
    def export_categories_pdf(self, request, queryset):
        headers = ['Category Name']
        data = [[category.category_name] for category in queryset]
        return generate_pdf('Categories_Report', headers, data)
    export_categories_pdf.short_description = "Export selected categories to PDF"
    
    def export_categories_csv(self, request, queryset):
        headers = ['Category Name']
        data = [[category.category_name] for category in queryset]
        return generate_csv('Categories_Report', headers, data)
    export_categories_csv.short_description = "Export selected categories to CSV"

# ✅ Brand Model Admin
class BrandAdmin(admin.ModelAdmin):
    search_fields = ('brand_name',)
    list_display = ('brand_name',)
    actions = ['export_brands_pdf', 'export_brands_csv']
    
    def export_brands_pdf(self, request, queryset):
        headers = ['Brand Name']
        data = [[brand.brand_name] for brand in queryset]
        return generate_pdf('Brands_Report', headers, data)
    export_brands_pdf.short_description = "Export selected brands to PDF"
    
    def export_brands_csv(self, request, queryset):
        headers = ['Brand Name']
        data = [[brand.brand_name] for brand in queryset]
        return generate_csv('Brands_Report', headers, data)
    export_brands_csv.short_description = "Export selected brands to CSV"

# ✅ Unit Model Admin
class UnitAdmin(admin.ModelAdmin):
    search_fields = ('unit_name',)
    list_display = ('unit_name',)
    actions = ['export_units_pdf', 'export_units_csv']
    
    def export_units_pdf(self, request, queryset):
        headers = ['Unit Name']
        data = [[unit.unit_name] for unit in queryset]
        return generate_pdf('Units_Report', headers, data)
    export_units_pdf.short_description = "Export selected units to PDF"
    
    def export_units_csv(self, request, queryset):
        headers = ['Unit Name']
        data = [[unit.unit_name] for unit in queryset]
        return generate_csv('Units_Report', headers, data)
    export_units_csv.short_description = "Export selected units to CSV"

class ProductAdmin(admin.ModelAdmin):
    list_display = ('p_name', 'category', 'brand', 'unit', 'p_price', 'p_qty')
    search_fields = ('p_name', 'category__category_name', 'brand__brand_name', 'unit__unit_name')
    list_filter = ('category', 'brand', 'unit')
    list_per_page = 20
    raw_id_fields = ('category', 'brand', 'unit')
    actions = ['export_products_pdf', 'export_products_csv']
    
    def export_products_pdf(self, request, queryset):
        headers = ['Product Name', 'Category', 'Brand', 'Unit', 'Price', 'Quantity']
        data = []
        for product in queryset:
            data.append([
                product.p_name,
                product.category.category_name,
                product.brand.brand_name,
                product.unit.unit_name,
                f"₹{product.p_price}",
                product.p_qty
            ])
        return generate_pdf('Products_Report', headers, data)
    export_products_pdf.short_description = "Export selected products to PDF"
    
    def export_products_csv(self, request, queryset):
        headers = ['Product Name', 'Category', 'Brand', 'Unit', 'Price', 'Quantity']
        data = []
        for product in queryset:
            data.append([
                product.p_name,
                product.category.category_name,
                product.brand.brand_name,
                product.unit.unit_name,
                f"₹{product.p_price}",
                product.p_qty
            ])
        return generate_csv('Products_Report', headers, data)
    export_products_csv.short_description = "Export selected products to CSV"

# ✅ Cart Model Admin
class CartAdmin(admin.ModelAdmin):
    list_display = ('user', 'created_at', 'get_total_amount')
    search_fields = ('user__username',)
    actions = ['export_carts_pdf', 'export_carts_csv']

    def get_total_amount(self, obj):
        return sum(item.total_price for item in obj.cart_items.all() if item.total_price is not None)
    get_total_amount.short_description = 'Total Amount'
    
    def export_carts_pdf(self, request, queryset):
        headers = ['User', 'Created At', 'Total Items', 'Total Amount']
        data = []
        for cart in queryset:
            data.append([
                cart.user.username,
                cart.created_at.strftime('%Y-%m-%d %H:%M'),
                cart.cart_items.count(),
                f"₹{self.get_total_amount(cart)}"
            ])
        return generate_pdf('Carts_Report', headers, data)
    export_carts_pdf.short_description = "Export selected carts to PDF"
    
    def export_carts_csv(self, request, queryset):
        headers = ['User', 'Created At', 'Total Items', 'Total Amount']
        data = []
        for cart in queryset:
            data.append([
                cart.user.username,
                cart.created_at.strftime('%Y-%m-%d %H:%M'),
                cart.cart_items.count(),
                f"₹{self.get_total_amount(cart)}"
            ])
        return generate_csv('Carts_Report', headers, data)
    export_carts_csv.short_description = "Export selected carts to CSV"

# ✅ CartItem Model Admin
class CartItemAdmin(admin.ModelAdmin):
    list_display = ('cart', 'product', 'quantity', 'added_at', 'get_total_price')
    search_fields = ('cart__user__username', 'product__p_name')
    actions = ['export_cart_items_pdf', 'export_cart_items_csv']

    def get_total_price(self, obj):
        return obj.total_price
    get_total_price.short_description = 'Total Price'
    
    def export_cart_items_pdf(self, request, queryset):
        headers = ['Cart User', 'Product', 'Quantity', 'Price', 'Total Price', 'Added At']
        data = []
        for item in queryset:
            data.append([
                item.cart.user.username,
                item.product.p_name,
                item.quantity,
                f"₹{item.price}",
                f"₹{self.get_total_price(item)}",
                item.added_at.strftime('%Y-%m-%d %H:%M')
            ])
        return generate_pdf('Cart_Items_Report', headers, data)
    export_cart_items_pdf.short_description = "Export selected cart items to PDF"
    
    def export_cart_items_csv(self, request, queryset):
        headers = ['Cart User', 'Product', 'Quantity', 'Price', 'Total Price', 'Added At']
        data = []
        for item in queryset:
            data.append([
                item.cart.user.username,
                item.product.p_name,
                item.quantity,
                f"₹{item.price}",
                f"₹{self.get_total_price(item)}",
                item.added_at.strftime('%Y-%m-%d %H:%M')
            ])
        return generate_csv('Cart_Items_Report', headers, data)
    export_cart_items_csv.short_description = "Export selected cart items to CSV"

# ✅ Order Model Admin
class OrderAdmin(admin.ModelAdmin):
    list_display = ('user', 'order_date', 'total_amount', 'payment_status', 'status', 'order_details_link')
    list_filter = ('payment_status', 'status', 'order_date')
    search_fields = ('user__username',)
    actions = ['export_orders_pdf', 'export_orders_csv']

    def order_details_link(self, obj):
        url = reverse('admin:myapp_order_change', args=[obj.id])
        return format_html('<a href="{}">View Details</a>', url)
    order_details_link.short_description = 'Details'
    
    def export_orders_pdf(self, request, queryset):
        headers = ['Order ID', 'User', 'Order Date', 'Total Amount', 'Status', 'Payment Status']
        data = []
        for order in queryset:
            data.append([
                order.id,
                order.user.username,
                order.order_date.strftime('%Y-%m-%d %H:%M'),
                f"₹{order.total_amount}",
                order.status,
                order.payment_status
            ])
        return generate_pdf('Orders_Report', headers, data)
    export_orders_pdf.short_description = "Export selected orders to PDF"
    
    def export_orders_csv(self, request, queryset):
        headers = ['Order ID', 'User', 'Order Date', 'Total Amount', 'Status', 'Payment Status']
        data = []
        for order in queryset:
            data.append([
                order.id,
                order.user.username,
                order.order_date.strftime('%Y-%m-%d %H:%M'),
                f"₹{order.total_amount}",
                order.status,
                order.payment_status
            ])
        return generate_csv('Orders_Report', headers, data)
    export_orders_csv.short_description = "Export selected orders to CSV"

# ✅ OrderItem Model Admin
class OrderItemAdmin(admin.ModelAdmin):
    list_display = ('order', 'product', 'quantity', 'price', 'get_total_price')
    search_fields = ('product__p_name',)
    actions = ['export_order_items_pdf', 'export_order_items_csv']

    def get_total_price(self, obj):
        return obj.quantity * obj.price
    get_total_price.short_description = 'Total Price'
    
    def export_order_items_pdf(self, request, queryset):
        headers = ['Order ID', 'Product', 'Quantity', 'Price', 'Total Price']
        data = []
        for item in queryset:
            data.append([
                item.order.id,
                item.product.p_name,
                item.quantity,
                f"₹{item.price}",
                f"₹{self.get_total_price(item)}"
            ])
        return generate_pdf('Order_Items_Report', headers, data)
    export_order_items_pdf.short_description = "Export selected order items to PDF"
    
    def export_order_items_csv(self, request, queryset):
        headers = ['Order ID', 'Product', 'Quantity', 'Price', 'Total Price']
        data = []
        for item in queryset:
            data.append([
                item.order.id,
                item.product.p_name,
                item.quantity,
                f"₹{item.price}",
                f"₹{self.get_total_price(item)}"
            ])
        return generate_csv('Order_Items_Report', headers, data)
    export_order_items_csv.short_description = "Export selected order items to CSV"

# ✅ Address Model Admin
class AddressAdmin(admin.ModelAdmin):
    list_display = ('user', 'full_address', 'city', 'state', 'pincode', 'is_default')
    search_fields = ('user__username', 'city', 'state')
    actions = ['export_addresses_pdf', 'export_addresses_csv']
    
    def export_addresses_pdf(self, request, queryset):
        headers = ['User', 'Full Address', 'City', 'State', 'Pincode', 'Is Default']
        data = []
        for address in queryset:
            data.append([
                address.user.username,
                address.full_address,
                address.city,
                address.state,
                address.pincode,
                'Yes' if address.is_default else 'No'
            ])
        return generate_pdf('Addresses_Report', headers, data)
    export_addresses_pdf.short_description = "Export selected addresses to PDF"
    
    def export_addresses_csv(self, request, queryset):
        headers = ['User', 'Full Address', 'City', 'State', 'Pincode', 'Is Default']
        data = []
        for address in queryset:
            data.append([
                address.user.username,
                address.full_address,
                address.city,
                address.state,
                address.pincode,
                'Yes' if address.is_default else 'No'
            ])
        return generate_csv('Addresses_Report', headers, data)
    export_addresses_csv.short_description = "Export selected addresses to CSV"

# ✅ Payment Model Admin
class PaymentAdmin(admin.ModelAdmin):
    list_display = ('user', 'order', 'payment_status', 'payment_date', 'amount')
    search_fields = ('user__username',)
    actions = ['export_payments_pdf', 'export_payments_csv']
    
    def export_payments_pdf(self, request, queryset):
        headers = ['Payment ID', 'User', 'Order ID', 'Amount', 'Status', 'Payment Date']
        data = []
        for payment in queryset:
            data.append([
                payment.payment_id,
                payment.user.username,
                payment.order.id,
                f"₹{payment.amount}",
                payment.payment_status,
                payment.payment_date.strftime('%Y-%m-%d %H:%M')
            ])
        return generate_pdf('Payments_Report', headers, data)
    export_payments_pdf.short_description = "Export selected payments to PDF"
    
    def export_payments_csv(self, request, queryset):
        headers = ['Payment ID', 'User', 'Order ID', 'Amount', 'Status', 'Payment Date']
        data = []
        for payment in queryset:
            data.append([
                payment.payment_id,
                payment.user.username,
                payment.order.id,
                f"₹{payment.amount}",
                payment.payment_status,
                payment.payment_date.strftime('%Y-%m-%d %H:%M')
            ])
        return generate_csv('Payments_Report', headers, data)
    export_payments_csv.short_description = "Export selected payments to CSV"

# ✅ Wishlist Admin
class WishlistAdmin(admin.ModelAdmin):
    list_display = ('user', 'product', 'added_on')
    search_fields = ('user__username', 'product__p_name')
    actions = ['export_wishlist_pdf', 'export_wishlist_csv']
    
    def export_wishlist_pdf(self, request, queryset):
        headers = ['User', 'Product', 'Added On']
        data = []
        for item in queryset:
            data.append([
                item.user.username,
                item.product.p_name,
                item.added_on.strftime('%Y-%m-%d %H:%M')
            ])
        return generate_pdf('Wishlist_Report', headers, data)
    export_wishlist_pdf.short_description = "Export selected wishlist items to PDF"
    
    def export_wishlist_csv(self, request, queryset):
        headers = ['User', 'Product', 'Added On']
        data = []
        for item in queryset:
            data.append([
                item.user.username,
                item.product.p_name,
                item.added_on.strftime('%Y-%m-%d %H:%M')
            ])
        return generate_csv('Wishlist_Report', headers, data)
    export_wishlist_csv.short_description = "Export selected wishlist items to CSV"

# ✅ Register Models with Admin Panel
admin.site.register(CustomUser, CustomUserAdmin)
admin.site.register(Role, RoleAdmin)
admin.site.register(Area, AreaAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Brand, BrandAdmin)
admin.site.register(Unit, UnitAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Cart, CartAdmin)
admin.site.register(CartItem, CartItemAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderItem, OrderItemAdmin)
admin.site.register(Address, AddressAdmin)
admin.site.register(Payment, PaymentAdmin)
admin.site.register(Wishlist, WishlistAdmin)