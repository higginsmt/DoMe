require 'spec_helper'

feature 'User submits new activity' do

  background do
    user = create(:user)
    sign_in_as(user)
    visit root_path
  end

  # assumes that user is redirected to the show page for that activity
  scenario 'successfully' do
    click_link 'Suggest an activity'
    fill_in 'Name', with: 'whoo'
    fill_in 'Description', with: 'yay'
    fill_in 'URL', with: 'http://www.google.com'
    fill_in 'Things Needed', with: 'grill, meat, charcoal, bbq sauce'
    click_button 'Submit'

    expect(page).to have_content 'whoo'
    expect(page).to have_content 'yay'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'grill, meat, charcoal, bbq sauce'
  end

  scenario 'unsuccessfully because they left some fields blank' do
    click_link 'Suggest an activity'
    fill_in 'Name', with: 'ring-ding-ding-ding-ding-ding'
    click_button 'Submit'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content 'Your activity has been successfully submitted'
  end

end
