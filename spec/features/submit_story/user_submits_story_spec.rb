require 'spec_helper'

feature 'User submits a story' do
  context 'when signed in', :js do
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
    end

    scenario 'as signed in user' do
      visit root_path
      click_button 'What should I do today?'
      click_button 'Do me!'
      click_button 'I Did It!'
      fill_in 'type your story here!', with: 'I had a great time'
      click_button 'story-submit'
      expect(page).to have_content 'I had a great time'
    end
  end
end
