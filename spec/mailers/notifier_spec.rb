require "rails_helper"

RSpec.describe NotifierMailer, type: :mailer do
  describe "welcome" do

    it "renders the headers" do
      user = create(:user)
      
      mail = NotifierMailer.welcome(user)

      expect(mail.subject).to match("Welcome")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreplay@celmatixChallenge.com"])
    end

    it "renders the body" do
      user = create(:user)
      
      mail = NotifierMailer.welcome(user)
  
      expect(mail.body.encoded).to match("thanks for resigering")
    end
  end

end
