RSpec.shared_context "user login" do
  Given!(:current_user) { FactoryGirl.create(:user) }

  When do
    visit new_user_session_path
    fill_in "Email", with: current_user.email
    fill_in "Password", with: current_user.password
    click_button "Log in"
  end
end
