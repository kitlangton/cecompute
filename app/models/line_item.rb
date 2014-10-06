class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  include ActionView::Helpers::NumberHelper
  def subtotal
    ((self.quantity-1) * self.product.duplicate_cost) + self.product.base_cost
  end

  def subtotal_as_currency
    number_to_currency(self.subtotal)
  end
end
