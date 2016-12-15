class ProductsController < ApplicationController

    def index
        @products = Product.all
        @user = current_user
    end

    def create
        product = current_user.products.new(product_params)
        if product.save
            redirect_to products_path
        else
            flash[:errors] = product.errors.full_messages
            redirect_to user_path(current_user)
        end
    end

    def update
        product = Product.find(params[:id])
        if product.update(purchased: true)
            Buyer.create(user: current_user, product:product)
            redirect_to user_path
        else
            flash["Transaction was unsuccesfully"]
            redirect_to user_path
        end
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
