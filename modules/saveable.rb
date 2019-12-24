module Saveable

	def save_as_pdf(txt)
		Prawn::Document.generate("invoice#{document_id}.pdf") do
			font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf")
  			text txt
  		end
  	end