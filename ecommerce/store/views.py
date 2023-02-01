from django.shortcuts import render, redirect
from store.models import Slider, Main_Category, Category, Sub_Category, Product, Product_Color, Product_Size, Cart, Customer, Wish_List, Product_Review, Branch
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string
from django.http import JsonResponse, HttpResponse
from django.db.models import Max, Min

#BasePage
def BASE(request):
    main_category = Main_Category.objects.all()
    category = Category.objects.all()
    context = {
        'main_category': main_category,
        'category': category,
    }
    return render(request, 'base.html', context)

#HomePage
def HOME(request):
    sliders = Slider.objects.all()
    main_category = Main_Category.objects.all().order_by('-id')
    category = Category.objects.all()
    sub_category = Sub_Category.objects.all()
    product = Product.objects.filter(sub_category_id = 8)

    context = {
        'sliders': sliders,
        'main_category': main_category,
        'category': category,
        'sub_category': sub_category,
        'product' : product,
    }
    return render(request, 'main/home.html', context)

#About Page
def ABOUT(request):
    return render(request, 'main/about.html')

#Contact Page
def CONTACT(request):
    branch = Branch.objects.all()
    context = {'branch': branch}
    
    return render(request, 'main/contact.html', context)

#All Products
def PRODUCT(request):
    category = Category.objects.all()
    sub_category = Sub_Category.objects.all()
    product = Product.objects.all()
    color = Product_Color.objects.all()
    size = Product_Size.objects.all()
    

    min_price = Product.objects.all().aggregate(Min('price'))
    max_price = Product.objects.all().aggregate(Max('price'))
    ColorID = request.GET.get('colorID')
    FilterPrice = request.GET.get('FilterPrice')
    if FilterPrice:
        Int_FilterPrice = int(FilterPrice)
        product = Product.objects.filter(price__lte = Int_FilterPrice)
    elif ColorID:
        product = Product.objects.filter(color_id = ColorID)    
    else:
        product = Product.objects.all()

    context = {
        'main_category': category,
        'category': category,
        'sub_category': sub_category,
        'product': product,
        'min_price': min_price,
        'max_price': max_price,
        'FilterPrice': FilterPrice,
        'color': color,
        'size' : size,        
    }
    return render(request, 'product/product.html', context)

#Filter Product
def filter_data(request):
    categories = request.GET.getlist('category[]')
    sub_category = request.GET.getlist('sub_category[]')
    size = request.GET.getlist('size[]')


    allProducts = Product.objects.all().order_by('-id').distinct()
    if len(categories) > 0:
        allProducts = allProducts.filter(category__id__in=categories).distinct()
    if len (sub_category) > 0:
        allProducts = allProducts.filter(sub_category__id__in=sub_category).distinct()
    if len (size) > 0:
        allProducts = allProducts.filter(size__id__in=size).distinct()    
            

    t = render_to_string('ajax/product.html', {'product': allProducts})

    return JsonResponse({'data': t})

#Search Product
def SEARCH(request):
    option = request.POST.get('select')
    if option == 'urun':
        query = request.POST.get('query')
        product = Product.objects.filter(name__icontains = query)
    elif option == 'barkod':
        query = request.POST.get('query')
        product = Product.objects.filter(id = query)   
    elif option == 'sehir':
        query = request.POST.get('query')
        branch = Branch.objects.get(city = query)
        product = Product.objects.filter(branch_id = branch.id)
    elif option == 'cadde':
        query = request.POST.get('query')
        branch = Branch.objects.get(street = query)
        product = Product.objects.filter(branch_id = branch.id)
    elif option == 'postakodu':
        query = request.POST.get('query')
        branch = Branch.objects.get(post_code = query)
        product = Product.objects.filter(branch_id = branch.id)          

    context = {'product': product}    

    return render(request, 'main/search.html', context)

#Product Detail Page
def PRODUCT_DETAILS(request, slug):
    product = Product.objects.filter(slug = slug)
    
    if product.exists():
        product = Product.objects.get(slug = slug)
    else:
        return redirect('404')

    review = Product_Review.objects.filter(product_id = product.id).all()   

    context = { 'product': product, 'review': review }

    return render(request, 'product/product_detail.html', context)

#Error Page
def Error404(request):

    return render(request, 'errors/404.html')

#Login and Register Page
def MY_ACCOUNT(request):

    return render(request, 'account/my_account.html')

#Register
def REGISTER(request):
    if request.method == "POST":
        name = request.POST.get('name')
        surname = request.POST.get('surname')
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')

        if User.objects.filter(username = username).exists():
            messages.error(request, 'Bu kullanıcı adı zaten mevcut')
            return redirect('login')

        if User.objects.filter(email = email).exists():
            messages.error(request, 'Bu email zaten mevcut')
            return redirect('login')    

        user = User(
            username = username,
            first_name = name,
            last_name = surname,
            email = email,
        )
        user.set_password(password)
        user.save()
        login(request, user)

        current_user = request.user
        data = Customer.objects.create(
            user_id = current_user.id,
            profile_photo = "uploads/20221221220840271085674.png",
        )
        data.save()
    return render(request, 'home')

#Login
def LOGIN(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username = username, password = password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, 'Email ve Şifre Yanlış !')
            return redirect('login')
    return render(request, 'login')

#Profile
@login_required(login_url='/login')
def PROFILE(request):
    current_user = request.user.id
    profile = Customer.objects.get(user_id=current_user)
    print(profile)
    context = { 'profile': profile }

    return render(request, 'profile/profile.html', context)

def REVIEWS(request):
    if request.method == "POST":

        query = request.POST.get('b1')
        print(query)      
        
    current_user = request.user.id

    review = Product_Review.objects.filter(user_id = current_user)

    context = {'review': review}


    return render(request, 'profile/reviews.html', context)    

#Profile Update
@login_required(login_url='/login')
def PROFILE_UPDATE(request):
    if request.method == "POST":
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        phone = request.POST.get('password')
        profil_photo = request.POST.FILES
        print(profil_photo)

        user_id = request.user.id

        customer = Customer.objects.get(id=user_id)
        customer.user.first_name = first_name
        customer.user.last_name = last_name
        customer.user.username = username
        customer.user.email = email
        customer.phone = phone
        customer.profile_photo = profil_photo

        if password != None and password != "":
            customer.user.set_password(password)
        customer.user.save()
        messages.success(request, 'Profil başarı ile güncellendi !')

        return redirect('profile')

#Logout
@login_required(login_url='/login')
def LOGOUT_USER(request):
    logout(request)
    return redirect('home')

#Delete Account
@login_required(login_url='/login')
def DELETE_USER(request):
    current_user = request.user.username
    
    delete_user = User.objects.get(username = current_user)
    delete_user.delete()

    return redirect('home')

#Cart
def CART(request):

    return render(request, 'cart/cart.html')

@login_required(login_url="/accounts/login/")
def cart_add(request, id):
    cart = Cart(request)
    product = Product.objects.get(id=id)
    cart.add(product=product)
    return redirect("cart_detail")


@login_required(login_url="/accounts/login/")
def item_clear(request, id):
    cart = Cart(request)
    product = Product.objects.get(id=id)
    cart.remove(product)
    return redirect("cart_detail")


@login_required(login_url="/accounts/login/")
def item_increment(request, id):
    cart = Cart(request)
    product = Product.objects.get(id=id)
    cart.add(product=product)
    return redirect("cart_detail")


@login_required(login_url="/accounts/login/")
def item_decrement(request, id):
    cart = Cart(request)
    product = Product.objects.get(id=id)
    cart.decrement(product=product)
    return redirect("cart_detail")


@login_required(login_url="/accounts/login/")
def cart_clear(request):
    cart = Cart(request)
    cart.clear()
    return redirect("cart_detail")


@login_required(login_url="/accounts/login/")
def cart_detail(request):
    return render(request, 'cart/cart.html')

def CHECKOUT(request):
    return render(request, 'cart/checkout.html')


#Wishlist
def ADD_WISHLIST(request):
	pid=request.GET['product']
	product=Product.objects.get(pk=pid)
	data={}
	checkw=Wish_List.objects.filter(product=product,user=request.user).count()
	if checkw > 0:
		data={
			'bool':False
		}
	else:
		wishlist=Wish_List.objects.create(
			product=product,
			user=request.user
		)
		data={
			'bool':True
		}
	return JsonResponse(data)

def MY_WISHLIST(request):
    wishlist = Wish_List.objects.filter(user=request.user).order_by('-id')
    return render (request, 'wishlist/wishlist.html', {'wishlist': wishlist})

#Review
def ADD_REVIEW(request):
    if request.method=="GET":
        prod_id = request.GET.get('prod_id')
        product = Product.objects.get(id= prod_id)
        comment = request.GET.get('comment')
        rate = request.GET.get('select')

        user = request.user
        customer = Customer.objects.get(user_id = user.id)
        customer.point = customer.point + 5
        customer.save()

        Product_Review(user=user, product=product, review_text = comment, review_rating = rate).save()

        return redirect("home")

    return render    
