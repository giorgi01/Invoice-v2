require_relative 'document'

class Invoice < Document

	attr_accessor :id, :seller, :buyer

	def initialize(id, seller, buyer)
		super(id)
		@seller = seller
		@buyer = buyer
	end
end

a = Invoice.new(1919, "Vabaco", "Evex")
puts a.id, a.seller