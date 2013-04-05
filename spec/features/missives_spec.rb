require 'spec_helper'

feature 'Handling missives' do
	scenario 'can create a missive' do
		visit '/'
		click_link 'View missives'
		click_link 'Create a new missive'
		fill_in 'Title', with: "some old tosh"
		fill_in 'Content', with: "this is a long rambling diatribe"
		click_button 'Create Missive'
		current_path.should == missife_path(Missive.last)
	end
end