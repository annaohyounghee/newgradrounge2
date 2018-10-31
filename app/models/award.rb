# == Schema Information
#
# Table name: awards
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer
#  image      :string
#

class Award < ApplicationRecord
  belongs_to :profile
end
