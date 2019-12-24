class Invoice

	attr_accessor :id, :seller, :buyer, :products, :price, :date

	def initialize(id, seller, buyer, products, price)
		@id = id
		@seller = seller
		@buyer = buyer
		@products = products
		@price = price
		time = Time.now
		@date = "#{time.day}/#{time.month}/#{time.year}"
	end
end
