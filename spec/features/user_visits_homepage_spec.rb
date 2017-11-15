require "rails_helper"

feature "UserVisitsHomepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css "h2", text: "Our Products"
  end
end
