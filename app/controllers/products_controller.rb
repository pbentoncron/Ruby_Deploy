class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @category = Category.all
  end

  def create
    Product.create(products_params)
    redirect_to '/products'
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(products_params)
    redirect_to '/products'
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/products'
  end

  def add_comment
    @product = Product.find(params[:comment][:product_id])
    Comment.create(comments_params)
    redirect_to product_path(@product)
  end

  def products_params
  params.require(:product).permit(:name, :description, :price, :category_id, :comment_id)   
  end

  def comments_params
  params.require(:comment).permit(:comment, :product_id)
  end
end
