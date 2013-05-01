require 'spec_helper'


feature "login/logout" do

	scenario "displays the user's email after successful login" do
		login
		expect(current_path).to eql user_path(@user)
		expect(page).to have_content @user.email
	end

	scenario "logged in user should be able to logout" do
		login
		click_link "Log Out"
		expect(current_path).to eql root_path
		expect(page).to have_content "Logged out!"
	end
end