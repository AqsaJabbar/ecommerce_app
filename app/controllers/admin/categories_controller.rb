module Admin
class CategoriesController < ApplicationController
    def index
        @categories = Category.all
      end
      def show
        @category=Category.find(params[:id])
      end
    def new
        @category=Category.new
    end
    def edit 
      @category=Category.find(params[:id])
    end
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to admin_category_path(@category)
      else
        render 'edit'
      end
    end
    def create
        @category = Category.new(category_params)
          if @category.save
              redirect_to admin_category_path(@category)
          else
              render 'new'
          end
    end
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_path
      end
      def sub
        @subcategory=Category.find(params[:id]).sub_categories
        
      end 
    private 
    def category_params
        params.require(:category).permit(:name,:image)
      end

end
end
