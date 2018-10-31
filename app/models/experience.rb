# == Schema Information
#
# Table name: experiences
#
#  id          :integer          not null, primary key
#  title       :string
#  company     :string
#  location    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  profile_id  :integer
#  from_date   :date
#  to_date     :date
#

class Experience < ApplicationRecord
  belongs_to :profile
  #Validation
  validates :title, presence: true
  validates :company, presence: true
  validates :from_date, presence: true, date: { before: Proc.new { Date.today }} 
  validates :to_date, presence: true, date: { before: Proc.new { Date.today }, after_or_equal_to: :from_date }
end
