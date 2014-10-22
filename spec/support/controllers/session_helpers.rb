module Controllers
  module SessionHelpers
    def login_super_admin
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:super_admin]
        @super_admin = FactoryGirl.create(:super_admin)
        sign_in :user, @super_admin
      end
    end

    def login_user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryGirl.create(:user)
        sign_in @user
      end
    end
  end
end
