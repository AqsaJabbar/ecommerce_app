class OrdersController < ApplicationController
    def new 
        @order=Order.new
        @cart_items=current_user.cart.cart_items
    end
    def create 
        @order = Order.new(order_params)
        if @order.save
          redirect_to order_path(@order)
        else
          render 'new'
        end
    end
    def show 
        @order=Order.find(params[:id])
    end
    def edit
        @order=Order.find(params[:id])
    end
    def update
        @order=Order.find(params[:id])
        if @order.update(order_params)
          redirect_to order_path(@order)
        else
          render 'edit'
        end
      end
    private 
    def order_params
        params.require(:order).permit(:name,:phone,:email,:address,:user_id)
      end
end
