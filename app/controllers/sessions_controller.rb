require 'bcrypt'

class SessionsController < ApplicationController

	include BCrypt

	def new
	end

	def create
		user = User.find_by_username( params[:username] )
		if ( user && user.authenticate( params[:password] ) )
			session[:user_id] = user.id
			key = Password.create( params[:username]+params[:password] )
			user.authToken = key
			user.save!
			redirect_to movies_path, notice: 'Successfully logged in!'
		else
			render json: { "loggedIn" => false }
		end
	end

	def destroy
		user = User.find_by_id ( session[:user_id] )
		user.authToken = nil
		user.save!
		reset_session
		redirect_to root_path
	end
end
