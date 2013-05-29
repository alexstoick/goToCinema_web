class ListsController < ApplicationController

	def index
		user = User.find(params[:id])
		@lists = user.lists
	end

end