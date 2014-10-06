class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  include ActionView::Helpers::NumberHelper

  def total
    sum = 0
    self.line_items.each do |line_item|
      sum += line_item.subtotal
    end
    number_to_currency(sum)
  end

end
