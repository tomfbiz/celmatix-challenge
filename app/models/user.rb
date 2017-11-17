# Inclues Clearance user functionality.
class User < ApplicationRecord
  include Clearance::User
  has_one :cart

  #  Constant +DEFAULT_ADMIN_EMAIL+  indicates which user is preset to admin
  DEFAULT_ADMIN_EMAIL = "admin@celmatixchallenge.com".freeze

  # Retunrs true if user is the "default admin" or if the +admin+ properrt is true
  def admin?
    email == DEFAULT_ADMIN_EMAIL || admin
  end
end
