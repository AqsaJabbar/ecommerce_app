class OrdersController < ApplicationController
    def new 
        @order=Order.new
        @cart_items=current_user.cart.cart_items
    end
    def create 
        @order = Order.new(order_params)
        @sum=0
        if @order.save
          current_user.cart.cart_items.each do |cart_item|
            @sum = @sum + (cart_item.total).to_i
            @order.order_items.create(         
               product_id: cart_item.product_id,
               quantity:   cart_item.quantity, 
               total:   cart_item.total
                )
            end
            @order.update(total: @sum)
          redirect_to order_items_path
        else
          render 'new'
        end
    end
    def show 
        @order=Order.friendly.find(params[:id])
    end
    def edit
        @order=Order.friendly.find(params[:id])
    end
    def update
        @order=Order.friendly.find(params[:id])
        if @order.update(order_params)
          redirect_to order_path(@order)
        else
          render 'edit'
        end
      end
    private 
    def order_params
        params.require(:order).permit(:name,:phone,:email,:address,:user_id,:total)
      end
end
