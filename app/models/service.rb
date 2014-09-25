class Service < ActiveRecord::Base
  validates :price, presence: true
  validates :price, :numericality => {allow_blank: true, :less_than => 99999999, message: "a bit pricey, eh?"}
  validates :name, presence: true

  before_save :titleize_name

  def titleize_name
    self.name = self.name.titleize
  end

end
