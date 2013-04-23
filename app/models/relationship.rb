# == Schema Information
#
# Table name: relationships
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  acquaintance_id :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Relationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :acquaintance, class_name: :User
end
