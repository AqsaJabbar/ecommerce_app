module Admin
class UsersController < ApplicationController
 def index
    @users = User.all
 end
 def show
    @user = User.find(params[:id])
  end
  def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to admin_users_path
  end
  private
    def user_params
        params.require(:user).permit(:firstname, :phone, :address, :role, :city_id)
   end
end
end