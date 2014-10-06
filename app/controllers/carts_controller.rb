class CartsController < ApplicationController

  def total
    @cart = current_user.cart
    respond_to do |format|
      format.json { render :json => { :total => @cart.total }}
    end
  end

  def update
    @cart = current_user.cart
    @cart.line_items.create(product_id: params[:product_id], quantity: params[:quantity])
    redirect_to cart_path
  end

  def show
    @cart = current_user.cart
    respond_to do |format|
      format.html
      format.csv { send_data @cart.to_csv, :filename => 'cart_data.csv' }
    end
  end


end
