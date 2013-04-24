module Features
	module SessionHelpers
		def signup
			user = FactoryGirl.attributes_for(:user)
			visit "/signup"
			fill_in "First name", with: user[:first_name]
			fill_in "Surname", with: user[:surname]
			fill_in "Email", with: user[:email]
			fill_in "Password", with: user[:password]
			fill_in "Password confirmation", with: user[:password_confirmation]
		end

		def login
			@user = FactoryGirl.create(:user)
			visit '/'
			fill_in 'email', with: @user.email
			fill_in 'password', with: @user.password
			click_button 'Log In'
		end
	end
end