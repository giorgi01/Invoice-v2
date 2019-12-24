require 'csv'
require_relative 'models/product'

class ReadCsv
	attr_reader :product_array
	def initialize(file_path, input_hash)
		@file_path = file_path
		@product_array = []
		@input_hash
	end

	def read_csv_data
		CSV.foreach(file_path, headers: true) do |row|
			if @input_hash[row["id"]]
				@product_array << Product.new(row["id"], row["name"], row["description"], row["price"])
			end
		end
		@product_array
	end
end