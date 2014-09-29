class OrdersController < ApplicationController
  respond_to :html, :js

  def create
    @order = Order.new(user_id: current_user.id)
    Rails.logger.info("PARAMS: #{params.inspect}")
    if @order.save
      params[:service_ids].each do |k, v|
        @order.order_services.create!(service_id: k) if v == "selected"
      end
      redirect_to @order
    else
      render
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

end
