class User < ActiveRecord::Base
  attr_accessible :email, :password, :username

	has_secure_password

end
