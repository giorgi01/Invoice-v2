require_relative 'modules/calculate_tax'
require 'csv'
require 'prawn'

class Invoice

	include Taxable

	@@id = 0

	attr_accessor :document_id, :seller, :buyer

	def initialize(seller, buyer)
		@seller = seller
		@buyer = buyer
		@@id += 1 
		@document_id = @@id 
	end
	
	def add_order
		CSV.open("order#{document_id}.csv", 'w') do |csv|
			csv << %w(id product description price qty)
		end
		puts 'If you want to exit please type \'exit\' or empty line'
		while true
			line = gets.chomp
			if line.empty? or line == 'exit'
				break
			end
			CSV.open("order#{document_id}.csv", 'a') do |csv|
  				csv << line.split(',') #ID,product,desc,price,qty
			end
		end
	end
			
	def calculated_price
		sum = 0
		CSV.foreach("order#{document_id}.csv", headers: true) do |row|
			sum += row['price'].to_i * row['qty'].to_i
		end
		sum
	end

	def total_price
		calculated_price + calculate_tax(calculated_price)
	end

	def tax_is
		calculate_tax(calculated_price)
	end

	def to_s
		time = Time.now
		txt = "\nINVOICE №#{document_id}\n\nSeller: #{seller} -> Buyer: #{buyer}\n"
		CSV.foreach("order#{document_id}.csv", headers: true) do |row|
			txt += "\nID: #{row['id']} | Product: #{row['product']} | Description: #{row['description']} | Price: #{row['price']} | Quantity: #{row['qty']}"
			txt += "\n--------------------------------------------------------------------------------------------------------------"		
		end
		txt += "\n\nTotal price to pay: #{total_price}GEL\n\nIncluding the taxes: #{tax_is}GEL\n\nDate: #{time.day}/#{time.month}/#{time.year}"
	end

	def save_pdf
		txt = to_s
		Prawn::Document.generate("invoice#{document_id}.pdf") do
			font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf")
  			text txt
  		end
  	end

end

a = Invoice.new("Vabaco", "Company Inc.")
b = Invoice.new("Vabaco", "Corporation Z")
a.add_order
a.save_pdf