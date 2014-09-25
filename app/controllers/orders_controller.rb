class OrdersController < ApplicationController
  respond_to :html, :js

  def create
    @order = Order.new
    Rails.logger.info("PARAMS: #{params.inspect}")
    if @order.save
      params[:service_ids].keys.each do |id|
        @order.order_services.create!(service_id: id)
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

  def order_params
    params.require(:service_ids).permit(:service_ids)
  end
end
