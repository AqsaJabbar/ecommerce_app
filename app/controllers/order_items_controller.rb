class OrderItemsController < ApplicationController
    def index
        @order_items=current_user.order.order_items
    end 
    private
    def order_item_params
        params.require(:order_item).permit(:product_id,:quantity,:total,:order_id)
      end
end
