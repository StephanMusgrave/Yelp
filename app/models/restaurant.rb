# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  created_at :datetime
#  updated_at :datetime
#

class Restaurant < ActiveRecord::Base
end
