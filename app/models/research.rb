# == Schema Information
#
# Table name: researches
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  profile_id  :integer
#

class Research < ApplicationRecord
  belongs_to :profile
  #Validation
  validates :description, presence: true
end
