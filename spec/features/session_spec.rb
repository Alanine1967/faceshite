require 'spec_helper'


feature "login/logout" do

	scenario "log in a user" do
		user = FactoryGirl.create(:user)
		visit '/'
		fill_in 'email', with: user.email
		fill_in 'password', with: user.password
		click_button 'Log In'
		expect(current_path).to eql user_path(user)
	end

	scenario "displays the user's email after successful login" do
		login
		expect(current_path).to eql user_path(@user)
	end

	scenario "logged in user should be able to logout" do
		login
		click_link "log out"
		expect(current_path).to eql root_path
	end
end