require 'spec_helper'

feature 'Visitor tries to submit new activity' do

  scenario 'is prompted to sign in' do
    visit root_path
    click_link("Suggest an activity")
  end

end
