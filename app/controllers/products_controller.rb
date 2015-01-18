class ProductsController < ApplicationController
  before_action :set_product,  only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_user.products
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :photo, :website, :price)
    end

    def authenticate
      redirect_to products_url, alert: 'Access denied!' unless @product.user == current_user
    end
end
