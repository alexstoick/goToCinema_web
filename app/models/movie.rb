class Movie < ActiveRecord::Base
	attr_accessible :actori, :gen, :nota, :regizor, :titluEn, :titluRo, :image

	has_many :showtimes

	def self.attributes_protected_by_default
		# default is ["id", "type"]
		["type"]
	end
end
