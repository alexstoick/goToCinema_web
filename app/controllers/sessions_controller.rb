class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find(1)
		if ( user && user.authenticate( params[:password] ) )
			session[:user_id] = user.id
			redirect_to user_path(user), notice: 'Log in.'
		end
	end

end
