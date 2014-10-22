module Features
  # Helper methods you can use in specs to perform common and
  # repetitive actions.

  # The 'login_as' method is a Warden test helper that
  # allows you to simulate a user login without having
  # to fill in the sign in form every time. Since we're
  # not testing the signing in part of the app here, we
  # can take advantage of the Warden helper and speed up
  # our integration tests.

  module SessionHelpers
    def login_admin
      @admin = create(:admin)
      login_as(@admin, scope: :admin)
    end

    def login_as_admin(admin)
      login_as(admin, scope: :admin)
    end

    def login_as_user(user)
      login_as(user, scope: :user)
    end

    def login_super_admin
      @super_admin = create(:super_admin)
      login_as(@super_admin, scope: :admin)
    end

    def login_user
      @user = create(:user)
      login_as(@user, scope: :user)
    end

    def sign_in(email, password)
      visit new_user_session_path
      within('#loginForm') do
        fill_in 'Email',    with: email
        fill_in 'Password', with: password
      end
      click_button 'Sign in'
    end

    def sign_up(name, email, password, confirmation)
      visit new_user_registration_path
      fill_in 'name',                  with: name
      fill_in 'email',                 with: email
      fill_in 'password',              with: password
      fill_in 'password_confirmation', with: confirmation
      click_button 'Sign up'
    end

    def sign_up_admin(name, email, password, confirmation)
      visit new_admin_registration_path
      fill_in 'admin_name',                  with: name
      fill_in 'admin_email',                 with: email
      fill_in 'admin_password',              with: password
      fill_in 'admin_password_confirmation', with: confirmation
      click_button 'Sign up'
    end

  end
end
