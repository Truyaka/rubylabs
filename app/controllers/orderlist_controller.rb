class OrderlistController < ApplicationController
	def orders
		reports = Dir['public/csvs/*.html']
		render json: reports.to_json
 	end

end
