class Invoice

	@@id = 0

	attr_accessor :document_id, :seller, :buyer

	def initialize(seller, buyer)
		@seller = seller
		@buyer = buyer
		@document_id = @@id +1 
		@@id += 1 
	end

end

a = Invoice.new("Vabaco", "Company Inc.")
b = Invoice.new("Vabaco", "Evex")
puts a.document_id, b.document_id