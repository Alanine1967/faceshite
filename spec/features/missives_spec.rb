require 'spec_helper'

feature 'CRUD actions' do

	before(:each) do
		@missive = FactoryGirl.create(:missive)
		visit '/'
	end

	scenario 'can create a missive with correct data' do
		click_link 'View missives'
		click_link 'Create a new missive'
		fill_in 'Title', with: @missive.title
		fill_in 'Content', with: @missive.content
		expect { click_button 'Create Missive' }.to change(Missive, :count).by(1)
	end

	scenario 'cannnot create missive without content' do
		click_link 'View missives'
		click_link 'Create a new missive'
		fill_in 'Title', with: ""
		fill_in 'Content', with: ""
		click_button 'Create Missive'
		expect(current_path).to eql missives_path
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Content can't be blank"
	end

	scenario 'can list missives' do
		click_link 'View missives'
		expect(page.current_url).to eql(missives_url)
		expect(page).to have_content @missive.title
		expect(page).to have_content @missive.content
	end

	scenario 'can show a missive' do
		click_link 'View missives'
		click_link @missive.title
		expect(page.current_url).to eql(missive_url(@missive))
		expect(page).to have_content @missive.content
	end

	scenario 'can edit a missive' do
		login
		visit '/'
		click_link 'View missives'
		click_link @missive.title
		click_link 'edit'
		expect(page.current_url).to eql(edit_missive_url(@missive))
		fill_in 'Title', with: "A new title"
		click_button 'Update'
		expect(page.current_url).to eql(missive_url(@missive))
		expect(page).to have_content "A new title"
	end

	scenario 'can delete a missive' do
		click_link 'View missives'
		click_link @missive.title
		click_link 'delete'
		expect(page.current_url).to eql(missives_url)
		expect(page).to have_content "Missive deleted!"
	end
end