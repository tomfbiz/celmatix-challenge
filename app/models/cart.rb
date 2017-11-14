class Cart < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user
  has_and_belongs_to_many :products

  def save(options = {})
    super
    # because of validates_uniqueness_of this will only happen in a race condition
  rescue ActiveRecord::RecordNotUnique
    errors.add(:model_id, "has already been taken")
    false
  end
end
