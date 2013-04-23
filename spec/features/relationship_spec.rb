require 'spec_helper'

feature "Adding acquaintances" do
	scenario "can add an acquaintance" do
		login
		FactoryGirl.create(:user)
		visit '/users'
		expect(click_link 'Add as an acquaintance').to 
							change(current_user.acquaintances).by(1)
		expect(current_path).to eq user_path(current_user)
	end
end