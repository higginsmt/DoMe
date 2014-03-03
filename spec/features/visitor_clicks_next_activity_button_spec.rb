require 'spec_helper'

feature 'Click next activity button' do
  background do
    @activity1 = create(:activity)
  end

  # scenario 'as a visitor' do
  #   visit root_path
  #   click_button 'Suggest an activity'
  #   expect(page).to have_content(@activity1.name)
  # end


end
