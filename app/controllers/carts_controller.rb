class CartsController < ApplicationController
     
    def new
       @cart = Cart.new
    end
   private
      def cart_item_params
        params.require(:cart_item).permit(:user_id)
      end
end
