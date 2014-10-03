class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :base_cost, presence: true
  validates :duplicate_cost, presence: true
  has_many :line_items

  before_save :titleize_name

  private

  def titleize_name
    self.name = name.titleize
  end
  mount_uploader :image, ProductImageUploader
end
