class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  include ActionView::Helpers::NumberHelper
  def base_cost_display
    number_to_currency(self.product.base_cost)
  end

  def duplicate_cost_display
    number_to_currency(self.product.duplicate_cost)
  end

  def subtotal
    ((self.quantity-1) * self.product.duplicate_cost) + self.product.base_cost
  end

  def subtotal_as_currency
    number_to_currency(self.subtotal)
  end
end
