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

require 'test_helper'

class EducationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
