class UsersController < ApplicationController
  before_action :current_user, only:[:show, :edit, :update, :destroy]
  before_action :authenticated, only:[:edit, :update, :destroy]
  before_action :unauthenticated, only:[:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:current_user_id] = @user.token
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
