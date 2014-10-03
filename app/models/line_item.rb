class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def subtotal
    ((self.quantity-1) * self.product.duplicate_cost) + self.product.base_cost
  end
end
