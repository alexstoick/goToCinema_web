class SessionsController < ApplicationController

	include BCrypt

	def new
	end

	def create
		user = User.find_by_username( params[:username] )
		if ( user && user.authenticate( params[:password] ) )
			session[:user_id] = user.id
			render json: { "loggedIn" => true , "user_id" => user.id , "key" => Password.create( params[:username]+params[:password] ) }
		else
			render json: { "loggedIn" => false }
		end
	end

	def destroy
		reset_session
		redirect_to root_path
	end
end
