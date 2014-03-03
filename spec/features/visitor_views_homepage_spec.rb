require 'spec_helper'

feature 'Visitor views homepage' do
  scenario 'displays home screen with button' do
    visit root_path
    expect(page).to have_content("Do Me!")  # App Title
    expect(page).to have_link("About")
    expect(page).to have_link("Suggest an activity")
    expect(page).to have_link("Sign in")
  end
end
