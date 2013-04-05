# == Schema Information
#
# Table name: missives
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Missive < ActiveRecord::Base
end
