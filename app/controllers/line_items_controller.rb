class LineItemsController < ApplicationController
  respond_to :html, :json

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to current_user.cart
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update(line_item_params)
    respond_to do |format|
      format.html
      format.json { render :json => { :line_item => @line_item, :subtotal => @line_item.subtotal } }
    end
  end

  def show
    @line_item = LineItem.find(params[:id])
    respond_to do |format|
      format.json { render :json => { :subtotal => @line_item.subtotal_as_currency } }
    end
  end

  private 

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

end
