module Features
	module MissivesHelpers
		def create_missive
		click_link 'Create a new missive'
		fill_in 'Title', with: @missive[:title]
		fill_in 'Content', with: @missive[:content]
		click_button 'Create Missive'
		end
	end
end