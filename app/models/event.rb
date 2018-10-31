class Event < ApplicationRecord
    belongs_to :user
    has_many :eventcomments, as: :eventcommentable, dependent: :destroy
end
