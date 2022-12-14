class CartItemsController < ApplicationController
  def index
    @cart_items=current_user.cart.cart_items
    end  
  def new
       @cart_item = CartItem.new
    end
  def create 
    @cart_item = CartItem.new(cart_item_params)
    @product = Product.find_by(params[:product_id])
    if @cart_item.save
      flash.alert = "Item added to cart."
      redirect_to admin_product_path(@product)
    else
      flash.alert = "Something went wrong."
      redirect_to admin_product_path(@product)
    end
  end
  def destroy 
    @cart_item = CartItem.find_by(params[:cart_id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  private
    def cart_item_params
      params.require(:cart_item).permit(:product_id,:quantity,:cart_id,:total)
    end
end
