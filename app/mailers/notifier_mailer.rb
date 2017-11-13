class NotifierMailer < ApplicationMailer
  def welcome(user)
    mail(to: user.email, subject: "Welcome to Celmatix Ecommerce")
  end
end
