class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  include ActionView::Helpers::NumberHelper
  require 'csv'

  def total
    sum = 0
    self.line_items.each do |line_item|
      sum += line_item.subtotal
    end
    number_to_currency(sum)
  end

  def to_csv
    CSV.generate do |csv|
      csv << ["Product Name", "Original Cost", "Duplicate Cost", "Quantity", "Subtotal"]
      line_items.each do |line_item|
        csv << [line_item.product.name, number_to_currency(line_item.product.base_cost), number_to_currency(line_item.product.duplicate_cost), line_item.quantity, number_to_currency(line_item.subtotal)]
      end
      csv << ["","","","Total",self.total]
    end
  end

end
