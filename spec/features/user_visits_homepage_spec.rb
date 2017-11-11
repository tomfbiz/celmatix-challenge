require 'rails_helper'

feature "UserVisitsHomepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css 'h1', text: 'Celmatix Challenge'
  end
end