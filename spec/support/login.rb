def login(user, options = {})
  if options[:avoid_capybara]
    post user_session_path, username: user.username, password: user.password
  else
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end