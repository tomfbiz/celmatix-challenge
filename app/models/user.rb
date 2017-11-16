class User < ApplicationRecord
  include Clearance::User
  has_one :cart

  DEFAULT_ADMIN_EMAIL = "admin@celmatix_challenge.com".freeze

  def admin?
    email == DEFAULT_ADMIN_EMAIL || admin
  end
end
