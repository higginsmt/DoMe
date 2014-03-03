require 'spec_helper'

feature 'Click next activity button' do
  background do
    @activity_0 = Activity.create(name: "Instructions card")
    @activity_1 = create(:activity)
    @activity_2 = create(:activity)

  end

  scenario 'as a visitor' do
    visit root_path
    expect(page).to have_content(@activity_0.name)
    click_button 'Suggest an activity'
    expect(page).to have_content(@activity_1.name)

  end
end