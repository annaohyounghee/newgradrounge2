# == Schema Information
#
# Table name: educations
#
#  id             :integer          not null, primary key
#  school         :string
#  degree         :string
#  field_of_study :string
#  grade          :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  profile_id     :integer
#  from_date      :integer
#  to_date        :integer
#

class Education < ApplicationRecord
  belongs_to :profile
  #Validation
  validates :school, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates_numericality_of :to_date, greater_than_or_equal_to: :from_date

end
