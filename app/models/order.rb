class Order < ActiveRecord::Base
  has_many :order_services
  has_many :services, :through => :order_services
end
