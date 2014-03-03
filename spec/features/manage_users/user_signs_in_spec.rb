require 'spec_helper'

feature 'User signs in' do

    background do
        @activity = create(:activity)
        @user = create(:user)
        visit root_path
        click_link 'Sign in'
    end

    # both of these are from the home page
    # later we will want to check sign-in from the "I Did It!" page

    scenario 'successfully' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password

        click_button 'Sign in'

        expect(page).to have_content "Signed in as #{@user.email}"
        expect(page).to have_content "Sign out"
    end

    scenario 'unsuccessfully because they gave invalid credentials' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: "gobbledygook"
        click_button 'Sign in'

        expect(page).to have_content 'Invalid'
        expect(page).to_not have_content 'Signed in as'
    end

end
