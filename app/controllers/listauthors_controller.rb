class ListauthorsController < ApplicationController
	def authorsPage
		
	end
	def showAuthors
		render json: AuthorDatatable.new(view_context)
	end
	def infoAuthor
		id = params[:id]
		@posts = Author.find(id).posts
		render json: @posts.as_json(include: [:author, :tags])
	end


	def showPost
		id = params[:id]
		render json: Post.find(id).as_json(include: [:author, :tags])
	end


	def showPostComments
		id = params[:id]
		render json: Comment.where(post: id)
	end



	def showAllPosts
		render json: PostDatatable.new(view_context) 
		# render json: Post.all.as_json(include: [:author, :tags])
	end



	def showPostByTags
		id = params[:id]
		render json: Tag.find(id).posts.as_json(include: [:author, :tags])
	end
end