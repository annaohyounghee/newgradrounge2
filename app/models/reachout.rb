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

class Reachout < ApplicationRecord
	belongs_to :user
	serialize :audience, Array
	serialize :interest, Array
	#kaminari for pagination
	paginates_per 5
	acts_as_taggable
	acts_as_followable
	has_many :comments, as: :commentable, dependent: :destroy
	is_impressionable
	#Validation
	validates :title, presence: true, length: { maximum: 150}
	validates :description, presence: true, length: { maximum: 250}
	validates :back_story, length: { maximum: 250}
	validates :reachout_type, presence: true
	validates :audience, presence: true
	validates :interest, presence: true
	# validates :reachout_when, date: { after: Proc.new { Date.today }, message: 'must be after today' }
	validates :mescellaneous, length: { maximum: 250}
	
	#For search into reachouts db
	searchkick word_start: [:title, 
							:reachout_type,
							:interest, 
							:user_firstname_from_relation,  
							:user_lastname_from_relation, 
							:tag_from_relation, 
							:skill_from_relation]
	
	def search_data
	  attributes.merge(
	    user_firstname_from_relation: self.user_firstname_from_relation,
	    user_lastname_from_relation: self.user_lastname_from_relation,
	    tag_from_relation: self.tag_from_relation,
	    skill_from_relation: self.skill_from_relation
	  )
	end

	def user_firstname_from_relation
	  self.user.first_name
	end

	def user_lastname_from_relation
	  self.user.last_name
	end

	# def education_from_relation
	#    self.user.profile.educations.map(&:school)
	# end

	def tag_from_relation
	   self.tag_list
	end

	def skill_from_relation
	   self.user.profile.tag_list
	end


end
