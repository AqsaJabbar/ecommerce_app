module  Admin
class ShopsController < ApplicationController
    def index
      @shop = current_user.shop
      end
      def show
        @shop = current_user.shop
        # @shop=Shop.find(params[:id])
      end
    def new
        @shop=Shop.new
    end
    def edit 
      @shop=Shop.friendly.find(params[:id])
    end
    def update
      @shop = Shop.friendly.find(params[:id])
   
      if @shop.update(shop_params)
        redirect_to(@shop)
      else
        render 'edit'
      end
    end
    def create
        @shop = Shop.new(shop_params)
          if @shop.save
              redirect_to admin_shop_path(@shop)
          else
              render 'new'
          end
    end
    def destroy
        @shop = Shop.friendly.find(params[:id])
        @shop.destroy
        redirect_to admin_shop_path(@shop)
      end
    private 
    def shop_params
        params.require(:shop).permit(:name, :user_id)
      end
end
end