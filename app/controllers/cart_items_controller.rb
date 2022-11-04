class CartItemsController < ApplicationController
  def index
    @cart=current_user.cart
     @cart_items=@cart.cart_items
    end  
  def new
       @cart_item = CartItem.new
    end
  def create 
    @cart_item = CartItem.new(cart_item_params)
    @product = Product.find_by(params[:product_id])
    @cart=current_user.cart
    if @cart_item.save
      flash.alert = "Item added to cart."
      redirect_to admin_product_path(@product)
    else
      flash.alert = "Something went wrong."
      redirect_to admin_product_path(@product)
    end
  end
  private
    def cart_item_params
      params.require(:cart_item).permit(:product_id,:quantity,:cart_id)
    end
end
