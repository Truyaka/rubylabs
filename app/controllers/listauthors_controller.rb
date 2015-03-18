class ListauthorsController < ApplicationController
	def authorsPage
		
	end
	def showAuthors
		render json: Author.all.to_json
	end
	def infoAuthor
		id = params[:id]
		posts = Post.order("created_at").where(author: id)
		render json: posts.to_json
	end
	def showPost
		id = params[:id]
		render json: Post.find(id).to_json
	end
	def showPostComments
		id = params[:id]
		render json: Comment.where(post: id)
	end
	def showAllPosts
		render json: Post.all.to_json
	end
	def showPostByTags
		id = params[:id]
		tag = Tag.find(id)
		render json: Post.where(tags: tag).to_json
	end
end