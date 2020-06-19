class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      #チェックボックスが押されている時(:remember_meの値は押してれば1、無ければ0)のみ永続ログイン
      params[:session][:remember_me] == '1' ? remember_me(user) : forget(user)
      flash[:success] = "ログインしました"
      redirect_to user_url(user)
    else
      flash.now[:danger] = "メールアドレスとパスワードの組み合わせが間違っています"
      render 'sessions/new'
    end

  end

  def destroy
    log_out if logged_in?
    flash[:success] = "ログアウトしました"
    redirect_to login_path
  end
end
