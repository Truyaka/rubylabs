# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags=Array.new(20)
i=0
20.times do
	tags[i]=Tag.create(label: Faker::Lorem.word)
	i+=1
end
2.times do 
	author = Author.create(name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, adress: Faker::Address.street_address, birth: Faker::Date.forward(23))
	2.times do
		post = Post.create(author: author.id, label: Faker::Lorem.word, text: Faker::Lorem.sentence,tags: Tag.all.sample(3)) 
		2.times do
			comment = Comment.create(author: author.id, text: Faker::Lorem.sentence, post: post.id)
		end
	end
end
