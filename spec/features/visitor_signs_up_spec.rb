require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'from homepage' do
    visit root_path
    click_link("Sign in")
    click_link("Sign up")
    fill_in "Email", with: 'anna@example.com'
    fill_in "Password", with: 'asdfasdf'
    fill_in "Password confirmation", with: 'asdfasdf'
    click_button("Sign up")
    expect(page).to have_content("You have signed up successfully")
    expect(page).to have_content("Signed in as")
  end

end
