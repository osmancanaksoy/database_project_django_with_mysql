from django.urls import path, include
from . import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [

    # Errors Page
    path('404', views.Error404, name='404'),
    path('base/', views.BASE, name="base"),

    path('', views.HOME, name='home'),
    path('about', views.ABOUT, name="about"),
    path('contact', views.CONTACT, name="contact"),
    path('product', views.PRODUCT, name="product"),
    path('filter-data',views.filter_data, name="filter-data"),
    path('search/', views.SEARCH, name="search"),
    path('product/<slug:slug>', views.PRODUCT_DETAILS, name="product_detail"),

    # Account Urls
    path('account/my-account', views.MY_ACCOUNT, name="my_account"),
    path('account/register', views.REGISTER, name="handleregister"),
    path('account/login', views.LOGIN, name="handlelogin"),
    path('account/profile', views.PROFILE, name="profile"),
    path('account/reviews', views.REVIEWS, name="reviews"),
    path('account/profile/update', views.PROFILE_UPDATE, name="profile_update"),
    path('account/logout_user', views.LOGOUT_USER, name="logout_user"),
    path('account/delete_user', views.DELETE_USER, name="delete_user"),

    path('accounts/', include('django.contrib.auth.urls')),

    #Cart
    path('cart/add/<int:id>/', views.cart_add, name='cart_add'),
    path('cart/item_clear/<int:id>/', views.item_clear, name='item_clear'),
    path('cart/item_increment/<int:id>/',views.item_increment, name='item_increment'),
    path('cart/item_decrement/<int:id>/',views.item_decrement, name='item_decrement'),
    path('cart/cart_clear/', views.cart_clear, name='cart_clear'),
    path('cart/cart-detail/',views.cart_detail,name='cart_detail'),
    path('cart/checkout/', views.CHECKOUT, name="checkout"),

    #Wishlist
    path('add-wishlist', views.ADD_WISHLIST, name='add-wishlist'),
    path('my-wishlist', views.MY_WISHLIST, name='my-wishlist'),

    #Review
    path('review/add', views.ADD_REVIEW, name='add_review')
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)