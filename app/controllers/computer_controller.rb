class ComputerController < ApplicationController
  respond_to :html, :js

  def index
    @services = Service.all
    @order = Order.new
  end
end
