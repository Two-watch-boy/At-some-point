class SessionsController < ApplicationController

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
      flash[:notice] = "You did it! You logged in!"
    else
      redirect_to home_path
    end
  end

  def destroy    #destroy user login
    logout   #see in sessions helper
    flash[:notice] = "successfully logged out."
    redirect_to home_path
  end
  def testing
    1+2
  end

end
