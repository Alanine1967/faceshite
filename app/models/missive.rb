# == Schema Information
#
# Table name: missives
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Missive < ActiveRecord::Base
	validates :title, :content, presence: true
	belongs_to :user

end