class SessionsController < ApplicationController
  skip_before_action :authorize, only:[:new, :create, :destroy]

  def new
  end

  def create
    if User.count > 0
      user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admin_url
      else
        redirect_to login_url, notice: "Incorrect login or password"
      end
    else
      user = User.create(name: params[:name], password: params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "Session closed"
  end
end
