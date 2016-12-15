class ProductsController < ApplicationController

    def index
        @user = User.find(params[:id])
    end

    def create
        product = current_user.products.new(product_params)
        if product.save
            redirect_to product_path(current_user)
        else
            flash[:errors] = product.errors.full_messages
            redirect_to user_path(current_user)
        end
    end

    def show
        @products = Product.all
        @user = User.find(params[:id])
        @purchased = Product.where(purchased: false, user: current_user)
    end

    def update
        product = Product.find(params[:id])
        product.update(purchased: true)
        redirect_to user_path
    end

    def destroy
        Product.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private
      def product_params
          params.require(:product).permit(:name, :amount)
      end
end
