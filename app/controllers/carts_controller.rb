class CartsController < ApplicationController
    def index
        @carts=Cart.all
      end  
      def new
           @cart = Cart.new
        end
        def create 
          @cart = Cart.new(cart_params)
          @product = Product.find_by(params[:product_id])
          if @cart_item.save
            flash.alert = "Product added to cart."
              redirect_to admin_product_path(@product)
          else
            render 'new'
          end
        end
        private
        def cart_item_params
          params.require(:cart_item).permit(:cart_item_id,:user_id)
        end
end
