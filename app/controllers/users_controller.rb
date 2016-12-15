class UsersController < ApplicationController

    before_action :require_login, except: [:index, :new, :create]

  def index
  end

  def create
    user = User.new(user_params)
    if user.save
        session[:user_id] = user.id
        redirect_to user_path(session[:user_id])
    else
        flash[:errors] = user.errors.full_messages
        redirect_to root_path
    end
  end

  def show
    @products = Product.all
    @not_purchased = Product.where(purchased: false, user: current_user)
    @purchased = Product.where(purchased: true)
    @sold = Product.where(purchased: true, user: current_user)
    @user = current_user
  end

  private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
