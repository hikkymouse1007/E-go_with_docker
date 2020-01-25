module LoginSupport
  def log_in(user)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Log in"
  end


  def sign_up
    visit signup_path
    fill_in "name", with: "test_user"
    fill_in "email", with: "test@mail.com"
    fill_in "password", with: "foobar"
    fill_in "password_confirmation", with: "foobar"
    click_button "Create New Account"
  end
  end