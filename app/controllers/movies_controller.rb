class MoviesController < ApplicationController

	def index
		if ( session[:user_id] == nil )
			redirect_to login_path , notice:"You have to be logged in"
		end
		@movies = Movie.all
	end

	def show



		@movie = Movie.find(params[:id])
	end

	def aparitii
		@movie = Movie.find(params[:id])
	end
	def favorite

		movie_id = params[:id]
		user_id = session[:user_id]
		user = User.find(user_id)
		#favoritele sunt lista 1
		list_id = user.lists[0].id
		entry = ListEntry.new
		entry.movie_id = movie_id
		entry.list_id = list_id
		entry.save!
		render json: { "success" => ! entry.new_record? }
	end
end
