require 'spec_helper'

feature "Managing acquaintances" do
	before(:each) do
	  login
	  @acquaintance = FactoryGirl.create(:acquaintance)
	end

	scenario "can add an acquaintance" do
		visit '/users'
		expect { click_link 'Add as an acquaintance' }.to change(Relationship, :count).by(1)
		expect(current_path).to eql users_path
	end

	scenario "adding an acquaintance will remove them from list of potentials" do
		visit '/users'
		expect(page).to have_content "Richard Briers"
		click_link 'Add as an acquaintance'
		expect(page).to_not have_content "Richard Briers"
	end

	scenario "adding an acquaintance will create an inverse relationship" do
		visit '/users'
		click_link 'Add as an acquaintance'
		expect(@acquaintance.inverse_acquaintances.count).to eql 1
	end

	scenario "can remove an acquaintance" do
		@user.relationships.create(acquaintance_id: @acquaintance.id)
		visit relationships_path
		expect { click_link 'delete acquaintance' }.to change(Relationship, :count).by(-1)
		expect(current_path).to eql users_path
	end
end