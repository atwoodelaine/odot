require "spec_helper"

describe "Logging In" do
	it "displays the email address in the even of a failed login" do
	visit new_user_session_path
	fill_in "Email Address" , with: "becky.e.atwood@gmail.com"
	fill_in "Password", with: "incorrect"
	click_button "Log In"

	expect(page).to have_content("Please check your email and password")
	expect(page).to have_field("Email", with: "becky.e.atwood@gmail.com")
	end
end