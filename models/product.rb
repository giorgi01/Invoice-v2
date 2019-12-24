class Product

	attr_accessor :id, :name, :description, :price, :quantity

	def initialize(id, name, decription, price, quantity)
		@id = id
		@name = name
		@decription = description
		@price = price
		@quantity = quantity
		@total_price = 0
	end

end
