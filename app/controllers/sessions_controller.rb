class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    # If the user exists AND the password entered is correct.
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:current_user] = @user
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      flash.alert = "Oops! Either the username or password was incorrect. Please try again!"  
      redirect_to '/login'
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to '/login'
  end

end
