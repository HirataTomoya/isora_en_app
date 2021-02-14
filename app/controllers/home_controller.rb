class HomeController < ApplicationController
  def loginform
  end

  def login
    @user = User.find_by(password: params[:password])
    if @user
      session[:user_id] = @user.user_id
      redirect_to("/home/menu1")
    else
      redirect_to("/home/loginform")
      flash[:notice] = "パスワードが間違っています"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/home/loginform")
  end

  def menu1

  end

  def leveltop
    @level = params[:id]
  end
end
