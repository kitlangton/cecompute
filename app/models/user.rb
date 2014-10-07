class User < ActiveRecord::Base
  has_many :orders
  has_one :cart
  before_save :create_cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def create_cart
    Cart.create(user_id: self.id)
  end
end
