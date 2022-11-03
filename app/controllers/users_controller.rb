module Admin
class UsersController < ApplicationController
 def index
    @users = User.all
 end
 def show
    @user = User.find(params[:id])
  end
  private
    def user_params
        params.require(:user).permit(:firstname, :phone, :address, :role, :city_id)
   end
end
end