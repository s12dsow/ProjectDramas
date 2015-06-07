require "rails_helper"

feature "User can search dramas" do
  include_context "user login"

  context "returns results of search" do
    When { fill_in "search", with: "Coffee" }
    When { click_link_or_button "Search" }
    Then { expect(page).to have_content("Coffee Prince") }
  end
end
