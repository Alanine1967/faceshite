require 'spec_helper'

feature "signup" do

	scenario "signup with legal data" do
		signup
		expect { click_button "Sign Up" }.to change(User, :count).by(1)
		expect(current_path).to eql user_path(User.last)
	end

	scenario "signup without first name or surname should fail" do
		signup
		fill_in "user_first_name", with: ""
		fill_in "user_surname", with: ""
		click_button "Sign Up"
		expect(page).to have_content "First name can't be blank"
		expect(page).to have_content "Surname can't be blank"
	end

	scenario "signup with non-matching password & confirmation should fail" do
		signup
		fill_in "user_password_confirmation", with: "passwrod"
		click_button "Sign Up"
		expect(page).to have_content "Password confirmation doesn't match"
	end

	scenario "password should be at least 6 characters long" do
		signup
		fill_in "user_password", with: "pass"
		fill_in "user_password_confirmation", with: "pass"
		click_button "Sign Up"
		expect(page).to have_content "Password is too short"
	end
end