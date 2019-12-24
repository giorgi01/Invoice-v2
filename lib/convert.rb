require_relative 'product'
require_relative 'product_full_data'

module Convert
  def convert(arr,hash)
    full_data =[]
    arr.each do |x|
      full_data << Fulldata.new(x.id , x.name , x.description , x.price , hash[x.id])
    end
    full_data
  end
end
