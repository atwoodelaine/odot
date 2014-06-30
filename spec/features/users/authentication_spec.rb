require "spec_helper"


describe "Logging In" do

	it "logs the user in and goes to the todo lists" do
		User.create(first_name: "Becky", last_name: "Atwood", email: "becky.e.atwood@gmail.com", password: "password1234", password_confirmation: "password1234")
			visit new_user_session_path
			fill_in "Email Address" , with: "becky.e.atwood@gmail.com"
			fill_in "Password", with: "password1234"
			click_button "Log In"

			expect(page).to have_content("Todo Lists")
			expect(page).to have_content("Thanks for logging in!")

	end

	it "displays the email address in the even of a failed login" do
	visit new_user_session_path
	fill_in "Email Address" , with: "becky.e.atwood@gmail.com"
	fill_in "Password", with: "incorrect"
	click_button "Log In"

	expect(page).to have_content("Please check your email and password")
	expect(page).to have_field("Email", with: "becky.e.atwood@gmail.com")
	end
end