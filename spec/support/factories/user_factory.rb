FactoryGirl.define do
	factory :user do
		first_name "Norman"
		surname "Bates"
		email "nbates@batesmotel.com"
		password "password"
		password_confirmation "password"
	end

	factory :acquaintance, class: User do
		first_name "Richard"
		surname "Briers"
		email "dicky@batesmotel.com"
		password "password"
		password_confirmation "password"
	end

	factory :missive do
		title "Some title."
		content "Some content."
		user
	end
end