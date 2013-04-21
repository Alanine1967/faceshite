# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  first_name      :string(255)
#  surname         :string(255)
#

class User < ActiveRecord::Base
	has_secure_password
	validates :email, :password_digest, :first_name, :surname, presence: true
	validates :password, length: { minimum: 6 }
end
