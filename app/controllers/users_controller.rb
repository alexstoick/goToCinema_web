class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def view
		@user = User.find ( params[:id] )
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			redirect_to @user, notice: 'User was successfully created.'
		end
	end

	def messages
		render :text => "messages"
	end

	def lists
		render :text => "lists"
	end

	def wall
		@user = User.find ( params[:id] )
	end

	def friends
		@user = User.find ( params[:id] )
	end

end
