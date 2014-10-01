class ProductsController < ApplicationController
  respond_to :html, :js

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
      flash[:success] = "Product created!"
    else
      render 'new'
      flash[:error] = "Product not created."
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name,:base_cost,:duplicate_cost,:image)
  end

end
