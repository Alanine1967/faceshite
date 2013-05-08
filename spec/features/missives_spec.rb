require 'spec_helper'

feature 'Handling missives' do

	before(:each) do
		login
		@acquaintance = FactoryGirl.create(:acquaintance)
		@missive = FactoryGirl.attributes_for(:missive)
		visit users_path
		click_link "Add as an acquaintance"
		click_link "you have 1 acquaintance"
	end

	scenario 'can create a missive with correct data' do
		click_link 'send a missive'
		fill_in 'Title', with: @missive[:title]
		fill_in 'Content', with: @missive[:content]
		expect { click_button 'Create Missive' }.to change(Missive, :count).by(1)
		expect(@acquaintance.missives.to_a.count).to eql 1
	end

	scenario 'cannnot create missive without content' do
		click_link 'send a missive'
		fill_in 'Title', with: ""
		fill_in 'Content', with: ""
		click_button 'Create Missive'
		expect(current_path).to eql user_missives_path(@user)
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Content can't be blank"
	end

	scenario 'should be associated with a user' do
		create_missive
		expect(@user.missives.to_a.count).to eql 1
	end

	scenario 'can list missives' do
		create_missive
		expect(page).to have_content @missive[:title]
	end

	scenario 'can show a missive' do
		create_missive
		click_link @missive[:title]
		expect(page.current_url).to eql missive_url(@user.missives.last)
		expect(page).to have_content @missive[:content]
	end

	scenario 'can edit a missive' do
		create_missive
		click_link @missive[:title]
		click_link 'edit'
		fill_in 'Title', with: "A new title"
		click_button 'Update'
		expect(page).to have_content "A new title"
	end

	scenario 'can delete a missive' do
		create_missive
		click_link @missive[:title]
		expect { click_link 'delete' }.to change(Missive, :count).by(-1)
		expect(page.current_url).to eql(user_missives_url(@user))
		expect(page).to have_content "Missive deleted!"
	end
end