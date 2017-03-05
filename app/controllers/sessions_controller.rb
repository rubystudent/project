class SessionsController < ApplicationController
  before_action :authenticated, only:[:destroy]
  before_action :unauthenticated, only:[:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.token
      redirect_to root_path
    else
      flash.now[:authentication_error] = 'Invalid email or password!'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
