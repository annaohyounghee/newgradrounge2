# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user
  has_many :educations
  has_many :experiences
  has_many :awards
  has_many :researches
  acts_as_taggable
  searchkick

  after_commit :reindex_reachout

  def reindex_reachout
    Reachout.reindex # or reindex_async
  end

end