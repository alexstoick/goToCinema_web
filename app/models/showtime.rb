class Showtime < ActiveRecord::Base
	attr_accessible :hour, :movie_id, :place
	belongs_to :movie

	def self.attributes_protected_by_default
		# default is ["id", "type"]
		["type"]
	end

end
