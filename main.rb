#require_relative 'saveable'
#require_relative 'product'
#require_relative 'company'
require_relative 'readcsv'

puts "shemoiyvane myidveli"
buyer = gets.chomp

products = {}
puts 'Type comma-separated ID and Quantity'
puts 'If you want to exit please type \'exit\' or empty line'

while true
	line = gets.chomp
	splited_array = line.split(',')
	products[splited_array[0]] = splited_array[1] 
	break if line.empty? or line == 'exit'
	p products
end

product_obj = ReadCsv.new("data.csv", products)



=begin
product1 = Product.new(013,'Something','Black',200,5)
product2 = Product.new(014,'Something','Red',300,2)
company1 = Company.new('Company X')
company2 = Company.new('Company Y')
invoice1 = Invoice.new(101,company1,company2,[product1,product2])
=end