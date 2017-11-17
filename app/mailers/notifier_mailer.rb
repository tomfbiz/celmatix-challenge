# Mailer used for notifying users
class NotifierMailer < ApplicationMailer
  # Sends welcome email to the email address associated with the user.
  # Called when a user signs up
  # ==== Parameters
  #
  # +user+ -- record for user that just signed up
  def welcome(user)
    mail(to: user.email, subject: "Welcome to Celmatix Ecommerce")
  end
end
