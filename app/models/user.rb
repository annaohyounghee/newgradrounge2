# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  position               :string
#  faculty                :string
#  department             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  avatar                 :string
#

class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable

	#Extract first_name and last_name from email field
	after_validation :on => :create do |user|
  		user.first_name = user.email.split(".").first
  		user.last_name = user.email.split(".")[1].split("@").first
  		user.avatar = "http://res.cloudinary.com/darri/image/upload/v1450214068/osfb67hxdbv5dcllbger.png"
	end

	#kaminari for pagination
	paginates_per 10

	#Login validation
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                format: { with: VALID_EMAIL_REGEX },
	                uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6}, on: :create
	validates :position, presence: true
	#Devise plugin for authentication
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	#Relationships

	has_many :comments, dependent: :destroy
	has_one :profile, dependent: :destroy
	has_many :reachouts, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :eventcomments, dependent: :destroy


	has_many :private_messages, class_name: 'Private::Message'
	has_many :private_conversations, 
          foreign_key: :sender_id, 
          class_name: 'Private::Conversation'

	has_many :group_messages, class_name: 'Group::Message'
	has_and_belongs_to_many :group_conversations,
			class_name: 'Group::Conversation'

	#For image uploading
	mount_uploader :avatar, AvatarUploader

	#For following feature
	acts_as_follower
	
	#For search into users db
	searchkick word_start: [:first_name, 
							:last_name]

	after_commit :reindex_reachout

	def reindex_reachout
		Reachout.reindex # Reachout.reindex # or reindex_async
	end

end
