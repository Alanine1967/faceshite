require 'spec_helper.rb'

describe "Static pages" do
	let(:title) { "Faceshite |" }

	describe "Home page" do
		before(:each) { visit root_path }
		it "should have 'home' in the title" do
			page.should have_title "Faceshite | Home"
		end
	end
end