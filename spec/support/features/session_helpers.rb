module Features
	module SessionHelpers
		def signup
			user = FactoryGirl.attributes_for(:user)
			visit "/"
			fill_in "user_first_name", with: user[:first_name]
			fill_in "user_surname", with: user[:surname]
			fill_in "user_email", with: user[:email]
			fill_in "user_password", with: user[:password]
			fill_in "user_password_confirmation", with: user[:password_confirmation]
		end

		def login
			@user = FactoryGirl.create(:user)
			visit '/'
			fill_in 'email', with: @user.email
			fill_in 'password', with: @user.password
			click_button 'Log In'
		end

		def alternate_login
			visit '/'
			fill_in 'email', with: @acquaintance.email
			fill_in 'password', with: @acquaintance.password
			click_button 'Log In'
		end
	end
end