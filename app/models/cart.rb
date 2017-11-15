class Cart < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user
  has_many :carts_products
  has_many :products, through: :carts_products

  def save(options = {})
    super
    # because of validates_uniqueness_of this will only happen in a race condition
  rescue ActiveRecord::RecordNotUnique
    errors.add(:model_id, "has already been taken")
    false
  end
end
