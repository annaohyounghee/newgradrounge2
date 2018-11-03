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

require 'test_helper'

class ResearchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
