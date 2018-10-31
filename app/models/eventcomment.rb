class Eventcomment < ApplicationRecord
  belongs_to :user
  belongs_to :eventcommentable, polymorphic:true
  has_ancestry

end
