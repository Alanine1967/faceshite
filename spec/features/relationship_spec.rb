require 'spec_helper'

feature "Adding acquaintances" do
	scenario "can add an acquaintance" do
		login
		visit '/users'
		expect { click_link 'Add as an acquaintance' }.to change(Relationship, :count).by(1)
		expect(current_path).to eql user_path(current_user)
	end
end