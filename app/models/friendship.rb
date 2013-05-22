class Friendship < ActiveRecord::Base
	attr_accessible :friend_id, :status, :user_id

	belongs_to :user
	belongs_to :friend, :class_name => "User"

	# def self.pending
	# 	:condition => "status = 0"
	# end
	# def self.accepted
	# 	:condition => "status = 1"
	# end

	scope :pending, :conditions => {:status => 0}
	scope :accepted, :conditions => {:status => 1}

	def pending
		return self.status = 0
	end
	def accepted
		return self.status = 1
	end
end
