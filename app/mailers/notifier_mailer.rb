class NotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.welcome.subject
  #
  def welcome(user, sent_at = Time.now)
    mail(to: user.email, subject: 'Welcome to Celmatix Ecommerce')
  end
end
