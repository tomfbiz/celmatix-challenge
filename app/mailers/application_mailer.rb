# Sets defaults for child +mailer+ classes
class ApplicationMailer < ActionMailer::Base
  default from: "noreply@celmatixchallenge.com"
  layout "mailer"
end
