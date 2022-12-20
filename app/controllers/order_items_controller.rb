class OrderItemsController < ApplicationController
    
    private
    def order_item_params
        params.require(:order_item).permit(:product_id,:quantity,:total,:order_id)
      end
end
