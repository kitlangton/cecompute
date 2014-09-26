class ServicesController < ApplicationController
  respond_to :html, :js
  def new
    @service = Service.new
  end


  def create
    @service = Service.new(service_params)
    if @service.save
      @services = Service.all.sort_by(&:price)
      flash.now[:success] = "New Service: #{@service.name}"
    else
      render 'new'
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
  end

  private

  def service_params
    params.require(:service).permit(:name, :price)
  end
end
