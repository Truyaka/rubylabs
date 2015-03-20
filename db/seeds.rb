20.times do
	Tag.create(label: Faker::Lorem.word)
end
rand(20..30).times do |i|
	author = Author.create(name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, adress: Faker::Address.street_address, birth: Faker::Date.forward(23))
	puts "Author #{i}"
	rand(15..25).times do
		post = Post.create(author: author, label: Faker::Lorem.word, text: Faker::Lorem.sentence,tags: Tag.all.sample(3)) 
		puts "Posts #{i}"
		rand(1..5).times do
			comment = Comment.create(name: Faker::Name.name, text: Faker::Lorem.sentence, post: post)
			puts "Comment #{i}"
		end
	end
end