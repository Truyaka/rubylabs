20.times do
	Tag.create(label: Faker::Lorem.word)
end
rand(15..20).times do
	author = Author.create(name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, adress: Faker::Address.street_address, birth: Faker::Date.forward(23))
	rand(10..20).times do
		post = Post.create(author: author.id, name_author: author.name, label: Faker::Lorem.word, text: Faker::Lorem.sentence,tag: Tag.all.sample(3)) 
		rand(1..5).times do
			comment = Comment.create(name: Faker::Name.name, text: Faker::Lorem.sentence, post: post.id)
		end
	end
end