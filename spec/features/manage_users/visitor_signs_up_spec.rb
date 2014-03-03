require 'spec_helper'

feature 'Visitor signs up' do

  background do
    @activity = create(:activity)
    visit root_path
    click_link 'Sign in'
    click_link 'Sign up'
  end

  scenario 'successfully' do
    fill_in 'Email', with: 'anna@something.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Signed in as anna@something.com'
    expect(page).to have_link 'Sign out'
  end

  scenario 'unsuccessfully because they left fields blank' do
    click_button 'Sign up'
    expect(page).to_not have_content 'Signed in'
    expect(page).to have_content "can't be blank"
  end

end
