require 'spec_helper'

feature 'Visitor submits new activity successfully' do

  background do
    @user = create(:user) # only for 'successfully after sign in'
    visit root_path
    click_link 'Suggest an activity'
    fill_in 'Name', with: 'whoo'
    fill_in 'Description', with: 'yay'
    fill_in 'URL', with: 'http://www.google.com'
    fill_in 'Things Needed', with: 'grill, meat, charcoal, bbq sauce'
    click_button 'Submit'
  end

  scenario 'after sign up' do
    click_link 'Sign up'
    fill_in 'Email', with: 'anna@yay.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Signed in as anna@yay.com'
    expect(page).to have_content 'You have signed up successfully'
    expect(page).to have_content 'whoo'
    expect(page).to have_content 'yay'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'grill, meat, charcoal, bbq sauce'
  end

  scenario 'after sign in' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    expect(page).to have_content 'Signed in as'
    expect(page).to have_content 'whoo'
    expect(page).to have_content 'yay'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'grill, meat, charcoal, bbq sauce'
  end

end

feature 'Visitor submits new activity unsuccessfully' do

  scenario 'after sign in because they left some fields blank' do
    @user = create(:user)
    visit root_path
    click_link 'Suggest an activity'
    fill_in 'Name', with: 'whoo'
    click_button 'Submit'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    expect(page).to have_content 'Signed in as'
    expect(page).to have_content "can't be blank"
  end

end

