class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to products_path, :notice => "Account Created!"
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find(current_user.id)
  end

private
	def user_params
    params.require(:user).permit(:nick, :email, :password, :password_confirmation, :avatar )
  end
end
