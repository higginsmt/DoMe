require 'spec_helper'

feature 'User signs out' do
  scenario 'successfully' do
    @activity = create(:activity)
    user = create(:user)
    sign_in_as(user)
    click_link 'Sign out'
  end
end
