# == Schema Information
#
# Table name: reachouts
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  back_story     :string
#  reachout_type  :string
#  audience       :string
#  interest       :string
#  format         :string
#  duration       :string
#  reachout_when  :date
#  reachout_where :string
#  compensation   :string
#  mescellaneous  :string
#  user_id        :integer
#

require 'test_helper'

class ReachoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
