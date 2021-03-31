class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.notice = "Successfully Registered!"
      redirect_to '/login'
    else
      flash.notice = "Oops! There was an error resgistering your account. Please try again."
      redirect_to '/register'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email, 
      :password
    )
  end

end
