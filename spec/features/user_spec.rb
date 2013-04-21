require 'spec_helper'

feature "signup" do
	before(:each) do
		@user = FactoryGirl.create(:user)
		visit "/signup"
		fill_in "First name", with: @user.first_name
		fill_in "Surname", with: @user.surname
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		fill_in "Password confirmation", with: @user.password_confirmation
	end

	scenario "signup with legal data" do
		click_button "Sign Up"
		expect(current_path).to eql root_path
	end

	scenario "signup without first name or surname should fail" do
		fill_in "First name", with: ""
		fill_in "Surname", with: ""
		click_button "Sign Up"
		expect(current_path).to eql users_path
		expect(page).to have_content "First name can't be blank"
		expect(page).to have_content "Surname can't be blank"
	end

	scenario "signup with non-matching password & confirmation should fail" do
		fill_in "Password confirmation", with: "passwrod"
		click_button "Sign Up"
		expect(current_path).to eql users_path
		expect(page).to have_content "Password confirmation doesn't match"
	end

	scenario "password should be at least 6 characters long" do
		fill_in "Password", with: "pass"
		fill_in "Password confirmation", with: "pass"
		click_button "Sign Up"
		expect(current_path).to eql users_path
		expect(page).to have_content "Password is too short"
	end
end

feature "login/logout" do
	before(:each) do
		@user = FactoryGirl.create(:user)
		visit "/login"
		fill_in "Email", with: @user.email
		fill_in "Password", with: @user.password
		click_button "Log In"
	end

	scenario "displays the user's email after successful login" do
		expect(current_path).to eql root_path
		expect(page).to have_selector(".user_email", text: @user.email)
	end

	scenario "logged in user should be able to logout" do
		click_link "Log Out"
		expect(page).to have_content "Logged out"
	end
end