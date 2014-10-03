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
    respond_with @line_item
  end

  private 

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

end
