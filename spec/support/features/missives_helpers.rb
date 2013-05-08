module Features
	module MissivesHelpers
		def create_missive
		click_link 'send a missive'
		fill_in 'Title', with: @missive[:title]
		fill_in 'Content', with: @missive[:content]
		click_button 'Create Missive'
		end
	end
end