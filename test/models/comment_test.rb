# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_type :string
#  commentable_id   :integer
#  ancestry         :string
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
