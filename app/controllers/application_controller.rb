class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def require_sign_in!
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def set_cart!
    unless current_user.cart
      Cart.new(user_id: current_user.id)
    end
  end

end
