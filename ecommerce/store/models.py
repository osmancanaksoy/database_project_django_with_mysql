from django.db import models
from django.contrib.auth.models import User
import datetime
import os
from ckeditor.fields import RichTextField
from django.utils.text import slugify
from django.db.models.signals import pre_save
from django.conf import settings
from django.shortcuts import render, redirect
from django.utils.safestring import mark_safe
# Create your models here.

def get_file_path(request,filename):
    original_filename = filename
    nowTime = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')

    filename = "%s%s" % (nowTime,original_filename)
    return os.path.join('uploads/',filename)


class Slider(models.Model):
    DISCOUNT_DEAL = (
        ('SÜPER İNDİRİMLER', 'YENİ GELENLER',),
    )
    image = models.ImageField(upload_to='media/slider_images')
    slider_name = models.CharField(max_length=50)
    discount_deal = models.CharField(choices=DISCOUNT_DEAL, max_length=100)
    sale = models.IntegerField()
    discount = models.IntegerField()
    link = models.CharField(max_length=200)

    def __str__(self):
        return self.slider_name

class Branch(models.Model):
    name = models.CharField(max_length=20,null=False,blank=False)
    city =  models.CharField(max_length=20,null=False,blank=False)  
    street = models.CharField(max_length=20,null=False,blank=False) 
    post_code = models.CharField(max_length=6,null=False,blank=False)
    phone = models.CharField(max_length=20, null=True, blank=False)   
    def __str__(self):
        return self.name


class Main_Category(models.Model):
    name = models.CharField(max_length=150,null=False,blank=False)
    slug = models.SlugField(default="", max_length=500, null=True, blank=True) 
    
    def __str__(self):
        return self.name
    class Meta:
        db_table = "store_main_category"
    def get_absolute_url(self):
        from django.urls import reverse
        return reverse("", kwargs={'slug': self.slug})    

def create_main_category_slug(instance, new_slug=None):
    slug = slugify(instance.name)
    if new_slug is not None:
        slug = new_slug
    qs = Main_Category.objects.filter(slug=slug).order_by('-id')
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" % (slug, qs.first().id)
        return create_main_category_slug(instance, new_slug=new_slug)
    return slug

def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_main_category_slug(instance)
pre_save.connect(pre_save_post_receiver, Main_Category)    

class Category(models.Model):
    main_category = models.ForeignKey(Main_Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=150,null=False,blank=False)
    slug = models.SlugField(default="", max_length=500, null=True, blank=True) 
    
    def __str__(self):
        return self.main_category.name + " -- " + self.name
    class Meta:
        db_table = "store_category"
    def get_absolute_url(self):
        from django.urls import reverse
        return reverse("", kwargs={'slug': self.slug})    

def create_category_slug(instance, new_slug=None):
    slug = slugify(instance.name)
    if new_slug is not None:
        slug = new_slug
    qs = Category.objects.filter(slug=slug).order_by('-id')
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" % (slug, qs.first().id)
        return create_category_slug(instance, new_slug=new_slug)
    return slug

def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_category_slug(instance)
pre_save.connect(pre_save_post_receiver, Category)                   

class Sub_Category(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name =  models.CharField(max_length=150,null=False,blank=False)
    slug = models.SlugField(default="", max_length=500, null=True, blank=True)

    def __str__(self):
        return self.category.main_category.name + " -- " + self.category.name + " -- " + self.name

    def get_absolute_url(self):
        from django.urls import reverse
        return reverse("", kwargs={'slug': self.slug}) 

    class Meta:
        db_table = "store_sub_category"    

def create_sub_category_slug(instance, new_slug=None):
    slug = slugify(instance.name)
    if new_slug is not None:
        slug = new_slug
    qs = Sub_Category.objects.filter(slug=slug).order_by('-id')
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" % (slug, qs.first().id)
        return create_sub_category_slug(instance, new_slug=new_slug)
    return slug

def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_sub_category_slug(instance)
pre_save.connect(pre_save_post_receiver, Sub_Category)                      

class Product_Color(models.Model):
    code = models.CharField(max_length=100)
    def __str__(self):
        return self.code

class Product_Size(models.Model):
    MEMBERSHIP_CHOICES = [
        ("XS","X Small"),
        ("S","Small"),
        ("M","Medium"),
        ("L","Large"),
        ("XL","X Large"),
        ("36","36"),("38","38"),("40","40"),("42","42"),        
    ]
    name = models.CharField(max_length=2,choices = MEMBERSHIP_CHOICES,default="S")
    def __str__(self):
        return self.name

class Product(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE) 
    sub_category = models.ForeignKey(Sub_Category, on_delete=models.CASCADE, null=True)      
    name = models.CharField(max_length=150,null=False,blank=False)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    slug = models.SlugField(default="", max_length=500, null=True, blank=True)
    image = models.ImageField(upload_to=get_file_path, null=True, blank=True) 
    stock = models.IntegerField(null=False, blank=False)
    sales = models.IntegerField(default= 0,null=False, blank=False)
    price = models.FloatField(null=False,blank=False)
    color = models.ForeignKey(Product_Color, on_delete=models.CASCADE, null=True)
    size = models.ForeignKey(Product_Size, on_delete=models.CASCADE, null=True)
    information = RichTextField()
    discount = models.FloatField(null=False,blank=False)
    in_stock = models.BooleanField(default=False,help_text="0=default, 1=yok")
    is_trend = models.BooleanField(default=False,help_text="0=default, 1=Trending")

    def __str__(self):
        return self.name

    def get_photo_url(self):
        if self.image and hasattr(self.image, 'url'):
            return self.image.url    

    def get_absolute_url(self):
        from django.urls import reverse
        return reverse("product_detail", kwargs={'slug': self.slug})

    class Meta:
        db_table = "store_product"


def create_product_slug(instance, new_slug=None):
    slug = slugify(instance.name)
    if new_slug is not None:
        slug = new_slug
    qs = Product.objects.filter(slug=slug).order_by('-id')
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" % (slug, qs.first().id)
        return create_product_slug(instance, new_slug=new_slug)
    return slug

def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_product_slug(instance)
pre_save.connect(pre_save_post_receiver, Product)

class Product_Image(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image_url = models.CharField(max_length=200)

class Additional_Information(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    specification = models.CharField(max_length=100)
    detail = models.CharField(max_length=100)    

class Customer(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    phone = models.CharField(blank=True, max_length=20)
    profile_photo = models.ImageField(upload_to=get_file_path, null=True, blank=True)
    point = models.PositiveSmallIntegerField(default=0,null=True, blank=True)

    def get_photo_url(self):
        if self.profile_photo and hasattr(self.profile_photo, 'url'):
            return self.profile_photo.url  

    def ___str__(self):
        return self.user.username

    def user_name(self):
        return '[' + self.user.username + ']' + ' ' + self.user.first_name + ' ' + self.user.last_name 

    def image_tag(self):
        return mark_safe ('<img src="{}" height="50"/>'.format(self.profile_photo.url))

class Cart(models.Model):

    def __init__(self, request):
        self.request = request
        self.session = request.session
        cart = self.session.get(settings.CART_SESSION_ID)
        if not cart:
            # save an empty cart in the session
            cart = self.session[settings.CART_SESSION_ID] = {}
        self.cart = cart

    def add(self, product, quantity=1, action=None):
        """
        Add a product to the cart or update its quantity.
        """
        id = product.id
        newItem = True
        if str(product.id) not in self.cart.keys():

            self.cart[product.id] = {
                'userid': self.request.user.id,
                'product_id': id,
                'name': product.name,
                'quantity': 1,
                'price': str(product.price),
                'image': product.image.url
            }
        else:
            newItem = True

            for key, value in self.cart.items():
                if key == str(product.id):

                    value['quantity'] = value['quantity'] + 1
                    newItem = False
                    self.save()
                    break
            if newItem == True:

                self.cart[product.id] = {
                    'userid': self.request,
                    'product_id': product.id,
                    'name': product.name,
                    'quantity': 1,
                    'price': str(product.price),
                    'image': product.image.url
                }

        self.save()

    def save(self):
        # update the session cart
        self.session[settings.CART_SESSION_ID] = self.cart
        # mark the session as "modified" to make sure it is saved
        self.session.modified = True

    def remove(self, product):
        """
        Remove a product from the cart.
        """
        product_id = str(product.id)
        if product_id in self.cart:
            del self.cart[product_id]
            self.save()

    def decrement(self, product):
        for key, value in self.cart.items():
            if key == str(product.id):

                value['quantity'] = value['quantity'] - 1
                if(value['quantity'] < 1):
                    return redirect('cart:cart_detail')
                self.save()
                break
            else:
                print("Something Wrong")

    def clear(self):
        # empty cart
        self.session[settings.CART_SESSION_ID] = {}
        self.session.modified = True

class Wish_List(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return self.user.username + ' ' + self.product.name

class Product_Review(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    review_text = RichTextField()
    RATING = [
        ("1", "1"),
        ("2", "2"),
        ("3", "3"),
        ("4", "4"),
        ("5", "5"),     
    ]
    review_rating = models.CharField(choices=RATING, max_length=150)
    review_photo = models.ImageField(upload_to=get_file_path, null=True, blank=True)

    def get_photo_url(self):
        if self.review_photo and hasattr(self.review_photo, 'url'):
            return self.review_photo.url

    def __str__(self):
        return self.user.username + ' ' + self.product.name

class Address(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length= 25)
    address_line = models.CharField(max_length= 255)
    address_line_2 = models.CharField(max_length= 255)
    city =  models.CharField(max_length=20,null=False,blank=False)  
    street = models.CharField(max_length=20,null=False,blank=False) 
    post_code = models.CharField(max_length=6,null=False,blank=False)

    def __str__(self):
        return self.user.username + ' ' + self.name   
