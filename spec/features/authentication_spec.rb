require 'spec_helper'

feature "signup" do

	scenario "signup with legal data" do
		signup
		expect { click_button "Sign Up" }.to change(User, :count).by(1)
		expect(current_path).to eql root_path
	end

	scenario "signup without first name or surname should fail" do
		signup
		fill_in "First name", with: ""
		fill_in "Surname", with: ""
		click_button "Sign Up"
		expect(current_path).to eql users_path
		expect(page).to have_content "First name can't be blank"
		expect(page).to have_content "Surname can't be blank"
	end

	scenario "signup with non-matching password & confirmation should fail" do
		signup
		fill_in "Password confirmation", with: "passwrod"
		click_button "Sign Up"
		expect(current_path).to eql users_path
		expect(page).to have_content "Password confirmation doesn't match"
	end

	scenario "password should be at least 6 characters long" do
		signup
		fill_in "Password", with: "pass"
		fill_in "Password confirmation", with: "pass"
		click_button "Sign Up"
		expect(current_path).to eql users_path
		expect(page).to have_content "Password is too short"
	end
end

feature "login/logout" do

	scenario "displays the user's email after successful login" do
		login
		expect(current_path).to eql user_path(@user)
		expect(page).to have_selector(".user_email", text: @user.email)
	end

	scenario "logged in user should be able to logout" do
		login
		click_link "Log Out"
		expect(page).to have_content "Logged out"
	end
end