require "rails_helper"

feature "Signing in" do
  given(:user) { FactoryGirl.create(:user) }

  scenario "Signing in with correct credentials" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit root_path
    expect(page).to have_content "Welcome #{user.name}!"
  end

  scenario "Signing in with incorrect credentials" do
    visit new_user_session_path
    fill_in "Email", with: "wrong@email.com"
    fill_in "Password", with: user.password
    click_button "Log in"
    visit root_path
    expect(page).to have_content "Login"
  end
end
