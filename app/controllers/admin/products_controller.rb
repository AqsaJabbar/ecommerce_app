module Admin
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product=Product.friendly.find(params[:id])
    @cart_item=CartItem.new
  end
  def new
    @product = Product.new
  end
  def edit
    @product=Product.friendly.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
  else
      render 'new'
  end
  end

  def update
    @product=Product.friendly.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product=Product.friendly.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :status, :price, :image,:sub_category_id, :shop_id, :category_id,:user_id)
    end
end
end