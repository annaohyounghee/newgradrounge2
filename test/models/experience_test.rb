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

require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
