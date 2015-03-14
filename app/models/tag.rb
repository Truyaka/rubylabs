class Tag < ActiveRecord::Base
	belongs_to :posts_tags
	has_and_belongs_to_many :posts
end
