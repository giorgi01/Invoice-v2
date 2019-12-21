require_relative 'modules/calculate_vat'
require 'csv'

class Invoice

	include Vat

	@@id = 0

	attr_accessor :document_id, :seller, :buyer

	def initialize(seller, buyer)
		@seller = seller
		@buyer = buyer
		@@id += 1 
		@document_id = @@id 
	end
	
	def add_order
		puts 'If you want to exit please type \'exit\' or empty line'
		while true
			line = gets.chomp
			if line.empty?
				break
			end
			CSV.open('order.csv', 'a') do |csv|
  				csv << line.split(',') #ID,product,desc,price,qty
			end
		end
	end
			
	def calculated_price
		sum = 0
		CSV.foreach('order.csv', headers: true) do |row|
			sum += row['price'].to_i * row['qty'].to_i
		end
		sum
	end

	def total_price
		calculated_price + calculate_vat(calculated_price)
	end

	def vat_is
		calculate_vat(calculated_price)
	end

end

a = Invoice.new("Vabaco", "Company Inc.")
b = Invoice.new("Vabaco", "Corporation Z")
a.add_order
p a.calculated_price
puts "A total price to pay is: #{a.total_price}GEL"
puts "Including a vat: #{a.vat_is}GEL"