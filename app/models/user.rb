class User < ActiveRecord::Base
	attr_accessible :email, :password, :username, :auth_token, :nume, :prenume, :fullname

	has_many :posts, :class_name => "Post", :foreign_key => "sender_id"
	has_many :wall_posts, :class_name => "Post", :foreign_key => "receiver_id"

	has_secure_password


	def fullname
		return nume + " " + prenume
	end


end