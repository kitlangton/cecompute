class CartsController < ApplicationController

  def update
    @cart = current_user.cart
    @cart.line_items.create(product_id: params[:product_id], quantity: params[:quantity])
    redirect_to cart_path
  end

  def show
    @cart = current_user.cart
  end


end
