class Order < ActiveRecord::Base
  has_many :order_services
  has_many :services, :through => :order_services
  belongs_to :user

  def total
    total = 0 
    self.services.each do |service|
      total += service.price
    end
    total
  end
end
