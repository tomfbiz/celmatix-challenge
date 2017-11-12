class User < ApplicationRecord
  include Clearance::User

  def confirm_email!
    binding.pry
    Notifier.deliver_welcome(self)
    super
  end
end
