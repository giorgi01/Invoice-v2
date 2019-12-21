require_relative 'modules/calculate_vat'
require 'csv'

class Invoice

	include Vat

	@@id = 0

	attr_accessor :document_id, :seller, :buyer

	def initialize(seller, buyer)
		@seller = seller
		@buyer = buyer
		@document_id = @@id +1 
		@@id += 1 
	end

	def add_order
		hsh = {}
		CSV.foreach('data.csv', headers: true) do |row|
			hsh[row['product']+' '+row['description']] = Integer(row['price'])
		end
		hsh
	end

	def calculate_price
		#code
	end

	def total_price
		price + calculate_vat(price)
	end
end

a = Invoice.new("Vabaco", "Company Inc.")
b = Invoice.new("Vabaco", "Evex")
puts a.document_id, b.document_id
p a.add_order