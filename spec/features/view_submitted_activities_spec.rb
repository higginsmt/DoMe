require 'spec_helper'

feature 'User views submitted activities' do
  scenario 'as signed-in user' do
    user = create(:user)
    act1 = Activity.create(name: 'Play', url: 'http://google.com')
    user.created_activities << act1
    act2 = Activity.create(name: 'Bounce', url: 'http://google.com')
    user.created_activities << act2
    act3 = Activity.create(name: 'Laugh', url: 'http://google.com')
    user.created_activities << act3
    sign_in_as(user)
    click_link 'View my submissions'
    expect(page).to have_content(act1.name)
    expect(page).to have_content(act2.name)
    expect(page).to have_content(act3.name)
  end
end
