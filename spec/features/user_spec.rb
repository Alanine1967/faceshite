require 'spec_helper'

feature "editing/deleting user records" do
	before(:each) do
	  @user = FactoryGirl.create(:user)
		visit user_path(@user)
	end

	scenario "edit a user record" do
		click_link "change your details"
		expect(current_path).to eql edit_user_path(@user)
		fill_in "Surname", with: "Tebbit"
		fill_in "Password", with: @user.password
		fill_in "Password confirmation", with: @user.password_confirmation
		click_button "Update user"
		expect(current_path).to eql user_path(@user)
		expect(page).to have_content "User updated"
		expect(User.find(@user).surname).to eql "Tebbit"
	end

	scenario "delete a user record" do
		expect { click_link "Delete" }.to change(User, :count).by(-1)
	end
end

feature "index users" do
	scenario "show all but current user" do
		acquaintance = FactoryGirl.create(:acquaintance)
		login
		visit '/users'
		expect(page).to have_content(acquaintance.surname)
		expect(page).not_to have_content(@user.surname)
	end
end

feature "show user" do
	before(:each) do
		@acquaintance = FactoryGirl.create(:acquaintance)
		login
		visit '/users'
		click_link 'Add as an acquaintance'
		visit user_path(@user)
	end

	scenario "acquaintances should be displayed" do
		expect(page).to have_content "you have 1 acquaintance"
	end

	scenario "reverse_acquaintances should be displayed" do
		click_link "Log Out"
		alternate_login
		expect(page).to have_content "you have 1 acquaintance"
	end

	scenario "acquaintance count link should link to a list of acquaintances" do
		click_link "you have 1 acquaintance"
		expect(current_path).to eql relationships_path
		expect(page).to have_content @acquaintance.surname
		click_link "back"
		expect(current_path).to eql user_path(@user)
	end

	scenario "user page displays the user's missives" do
		pending
	end
end