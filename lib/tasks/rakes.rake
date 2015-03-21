require 'csv'

namespace :rakes do

	desc "Очищает и генерирует базу из задания на генерацию"
	task :fullreset do
		Rake::Task['db:reset'].invoke
  	end

	desc "Выгрузка в csv"
	task :exportcsv => :environment do
		CSV.open("public/csvs/csv#{rand(100)}.csv", "wb") do |file|
	 		file << Author.column_names
	 		Author.all.each do |author|
	 			file << author.attributes.values_at(*Author.column_names)
			end
		end
	end	

	desc "Выгрузка в html"
	task :exporthtml => :environment do
		File.open("public/csvs/html#{rand(100)}.html", "wb") do |html|
			html << "<html>"
				html << "<head><meta charset='utf-8'></head>"
				html << "<body>"
					html << "<div style='margin-left:750px;'>"
						html << "<span>Количество авторов - </span> #{Author.count}"
						html << "</br>"
						html << "<span>Количество постов - </span> #{Post.count}"
						html << "</br>"
						html << "<span>Количество комментариев - </span> #{Comment.count}"
						html << "</br>"
						html << "</br>"
						arr = Comment.group(:post_id).count.sort_by{|k,v| v}.last
						post = Post.find(arr[0])
						commCount = arr[1]
						html << "<span>Пост с наибольшим числом комметариев -  </span> "
						html << "<a href='http://localhost:3000/post?=#{post.id}'>#{post.label}</a>"
						html << "</br>"
						html << "<span>Количество комментариев -  #{commCount}</span>"
						html << "</br>"
						html << "</br>"
				 		html << "<table><tr><td>ID</td><td>Тег</td><td>Количество постов</td></tr>"
					 		Tag.all.each do |tag|
					 			html << "<tr><td>#{tag.id}</td><td>#{tag.label}</td><td>#{tag.posts.count}</td></tr>"
							end
				 		html << "</table>"
					html << "</div>"
		 		html << "</body>"
	 		html << "</html>"
		end
	end
end
