class SessionsController < ApplicationController

  def new
    # x @session = Session.new
    # o scope: :session + url: login_path
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
     flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  #DELETR/logout
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end