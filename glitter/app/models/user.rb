class User < ActiveRecord::Base
	has_secure_password
	has_many :statuses

	has_many :relationships
	#must specify associations within the join model b/c you're working on both side of the model(User)
	has_many :follower_relationships, class_name: "Relationships", foreign_key: "leader_id"
	has_many :leader_relationships, class_name: "Relationships", foreign_key: "follower_id"

	has_many :follower_users, through: :follower_relationships, source: :follower
	has_many :following_users, through: :leader_relationships, source: :leader

	validates :username, presence: true
	validates :email, presence: true


end
