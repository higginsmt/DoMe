module SessionHelpers

  def sign_in_as(user)
    # we're not actually creating a user here, that happens in the spec itself
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

end
