class Generateid
	attr_reader :id
   def initialize(txt_file_path)
      @txt_file_path = txt_file_path 
   end
    
    def readtxt
    	File.open(@txt_file_path, 'r') do |text| 
    		@id = text.read.chomp.to_i
    	end
    end

	def writetext
		File.open(@txt_file_path, 'w') do |file| 
			@id += 1
			file.write(id)
		end
	end
end
