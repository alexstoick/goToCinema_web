class Friendship < ActiveRecord::Base
	attr_accessible :friend_id, :status, :user_id

	belongs_to :user
	belongs_to :friend, :class_name => "User"

	scope :pending, :conditions => {:status => 0}
	scope :accepted, :conditions => {:status => 1}

	def pending
		return self.status = 0
	end
	def accepted
		return self.status = 1
	end
end
