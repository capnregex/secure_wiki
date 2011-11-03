RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  module ControllerMacros
    def login_user
      before(:each) do
        user = Factory.create(:user)
        sign_in user
      end
    end
  end
end
