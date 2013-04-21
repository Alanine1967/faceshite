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

require 'spec_helper'

describe User do
end
