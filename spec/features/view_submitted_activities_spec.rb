require 'spec_helper'

feature 'User views submitted activities' do
  scenario 'as signed-in user' do
    user = create(:user)
    sign_in_as(user)
    click_link 'Suggest an activity'
    fill_in 'Name', with: "Play guitar!"
    fill_in 'Description', with: 'Jam some tunes!'
    fill_in 'Things Needed', with: 'Guitar!'
    click_button 'Submit'
    click_link 'View my submissions'
    expect(page).to have_content("Play guitar!")
  end
end
