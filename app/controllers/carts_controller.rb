class CartsController < ApplicationController
  require 'cart_pdf'
  before_action :require_sign_in!
  before_action :set_cart!

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
    @cart = current_user.cart || Cart.create(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CartPdf.new(current_user, @cart)
        send_data pdf.render,
          filename: "Cart_#{Time.now.strftime("%h_%m")}.pdf",
          type: "application/pdf"
      end
      format.csv { send_data @cart.to_csv, :filename => 'cart_data.csv' }
    end
  end

end
