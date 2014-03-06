require 'spec_helper'

feature 'Visitor or user clicks new activity button' do
  context 'when not signed in', :js do
    background do
      user = create(:user)
      sign_in_as(user)
      click_link 'Suggest an activity'
      fill_in 'Name', with: "Play guitar!"
      fill_in 'Description', with: 'Jam some tunes!'
      fill_in 'Things Needed', with: 'Guitar!'
      click_button 'Submit'
      click_link 'Suggest an activity'
      fill_in 'Name', with: "Run outside!"
      fill_in 'Description', with: 'Get some exercise'
      fill_in 'Things Needed', with: 'Legs!'
      click_button 'Submit'
      click_link 'Sign out'
    end

    scenario 'multiple times' do
      visit root_path
      click_button("What should I do today?")
      expect(page).to_not have_content 'Do me! is a quick and easy way to decide what to do today'
    end
  end
end
