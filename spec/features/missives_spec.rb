require 'spec_helper'

feature 'Handling missives' do
	before(:each) do
		@missive = FactoryGirl.create(:missive)
		visit '/'
		click_link 'View missives'
	end

	scenario 'can create a missive' do
		click_link 'Create a new missive'
		fill_in 'Title', with: "some old tosh"
		fill_in 'Content', with: "this is a long rambling diatribe"
		click_button 'Create Missive'
		expect(current_path).to eql missive_path(Missive.last)
	end

	scenario 'can list missives' do
		expect(page.current_url).to eql(missives_url)
		expect(page).to have_content "Some title."
		expect(page).to have_content "Some content."
	end

	scenario 'can show a missive' do
		click_link "Some title."
		expect(page.current_url).to eql(missive_url(@missive))
		expect(page).to have_content "Some content."
	end

	scenario 'can edit a missive' do
		click_link 'Some title.'
		click_link 'edit'
		expect(page.current_url).to eql(edit_missive_url(@missive))
		fill_in 'Title', with: "A new title"
		click_button 'Update'
		expect(page.current_url).to eql(missive_url(@missive))
		expect(page).to have_content "A new title"
	end

	scenario 'can delete a missive' do
		click_link 'Some title.'
		click_link 'delete'
		expect(page.current_url).to eql(missives_url)
		expect(page).to have_content "Missive deleted!"
	end
end