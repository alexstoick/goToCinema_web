class UsersController < ApplicationController
	def index
		@users = User.all
		@singur = User.find(1)
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

end
