class ComputerController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def index
    @cart = current_user.cart || Cart.create(user_id:current_user)
    @services = Service.all
    @order = Order.new
  end
end
