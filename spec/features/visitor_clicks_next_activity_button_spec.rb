require 'spec_helper'

feature 'Click next activity button' do
  background do
    @activity = create(:activity)
  end

  scenario 'as a visitor' do
    visit root_path
    click_button 'Suggest an activity'
    expect(page).to have_content(@activity.name)
  end


end