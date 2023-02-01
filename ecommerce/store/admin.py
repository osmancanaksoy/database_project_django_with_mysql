from django.contrib import admin
from .models import *

# Register your models here.

class Product_Images(admin.TabularInline):
    model = Product_Image

class Additional_Informations(admin.TabularInline):
    model = Additional_Information

class Product_Admin(admin.ModelAdmin):
    inlines = (Product_Images, Additional_Informations)
    list_display = ('name', 'price','stock','sales', 'category')
    list_editable = ('category', 'price')

class Customer_Admin(admin.ModelAdmin):
    list_display = ('user_name', 'image_tag',)

admin.site.register(Slider)
admin.site.register(Branch)
admin.site.register(Main_Category)
admin.site.register(Category)
admin.site.register(Sub_Category)
admin.site.register(Product, Product_Admin)
admin.site.register(Product_Image)
admin.site.register(Additional_Information)
admin.site.register(Product_Color)
admin.site.register(Product_Size)
admin.site.register(Customer, Customer_Admin)
admin.site.register(Cart)
admin.site.register(Wish_List)
admin.site.register(Product_Review)
