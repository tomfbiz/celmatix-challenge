# <tt>validates_uniqueness_of :user</tt> to ensure that creating a
# second cart will throw an error rather than deleting the old cart.
class Cart < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user
  has_many :carts_products, dependent: :destroy
  has_many :products, through: :carts_products

  # Rescues +ActiveRecord::RecordNotUnique+.
  # Vecause of +validates_uniqueness_of+, this will only happen in a race condition
  def save(options = {})
    super
  rescue ActiveRecord::RecordNotUnique
    errors.add(:model_id, "has already been taken")
    false
  end
end
