module LoginSupport
  def log_in(user)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Log in"
  end


  def sign_up
    visit signup_path
    fill_in "user[name]", with: "test_user"
    fill_in "user[email]", with: "test@mail.com"
    fill_in "user[password]", with: "foobar"
    fill_in "user[password_confirmation]", with: "foobar"
    click_button "Create New Account"
  end
  end