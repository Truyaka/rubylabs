class ListauthorsController < ApplicationController
	def authorsPage
		
	end
	def showAuthors
		render json: Author.all.to_json
	end
	def infoAuthor
		id = params[:id]
		render json: Author.find(id).to_json
	end
end
