module Admin
class SubCategoriesController < ApplicationController
  def index
    
    @sub_categories=SubCategory.all
  end
  def show
    @sub_category=SubCategory.find(params[:id])
  end
  def new
    @sub_category=SubCategory.new 
  end
  def edit 
    @sub_category=SubCategory.find(params[:id])
   
  end
  def update
    @sub_category = SubCategory.find(params[:id])
   
    if @sub_category.update(sub_category_params)
    
      redirect_to admin_sub_category_path(@sub_category)
    else
      render 'edit'
    end
  end
  def create
    
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      redirect_to admin_sub_categories_path
    else
      render new
    end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy
    redirect_to admin_sub_categories_path
  end

  private 
  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id, :image)
  end

end
end
