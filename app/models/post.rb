class Post < ActiveRecord::Base
	belongs_to :authors
	has_and_belongs_to_many :tags
	has_many :comments
end
