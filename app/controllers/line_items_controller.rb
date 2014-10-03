class LineItemsController < ApplicationController

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to current_user.cart
  end

end
