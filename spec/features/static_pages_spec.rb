require 'spec_helper.rb'

feature "Static pages should have appropriate title" do

	scenario "Home page" do
		visit '/'
		page.should have_title "Faceshite | Home"
	end

	scenario "About page" do
		visit '/about'
		page.should have_title "Faceshite | About"
	end

	scenario "Contact page" do
		visit '/contact'
		page.should have_title "Faceshite | Contact"
	end

	scenario "Help page" do
		visit '/help'
		page.should have_title "Faceshite | Help"
	end
end