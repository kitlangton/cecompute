class UserController < ApplicationController
  def orders
    @orders = Order.where(user_id: current_user.id)
  end
end
