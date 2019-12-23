require_relative 'invoice'
a = Invoice.new("Vabaco", "Company Inc.")
b = Invoice.new("Vabaco", "Corporation Z")
a.add_order
a.save_pdf
