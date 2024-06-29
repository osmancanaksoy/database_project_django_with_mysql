from django import template
import math

register = template.Library()

@register.simple_tag
def call_sellprice(price, discount):
    if price is None or discount is 0:
        return price
    sale_price = price - (price * discount/100)
    return math.floor(sale_price)  

@register.simple_tag
def progress_bar(stock, sales):
    progress_bar = sales
    progress_bar = sales * (100/stock)
    return math.floor(progress_bar)    