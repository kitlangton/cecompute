class ComputerController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def index
    @services = Service.all
    @order = Order.new
  end
end
