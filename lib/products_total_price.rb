require_relative 'product_full_data'
module Calculator
  def products_total_price(arr)
    sum = 0.0
    arr.each do |x|
      sum += x.total_price
    end
    sum
  end

end
