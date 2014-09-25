class Service < ActiveRecord::Base
  validates :price, presence: true
  validates :price, :numericality => {allow_blank: true, :less_than => 99999999, message: "a bit pricey, eh?"}
  validates :name, presence: true

  has_many :order_services
  has_many :orders, :through => :order_services

  before_save :titleize_name

  

  private

  def titleize_name
    self.name = self.name.titleize
  end

end
