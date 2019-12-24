require_relative 'product'
class Fulldata < Product
  attr_reader :total_price , :quantity
  def initialize(id,name,description,price,quantity)
    super(id,name,description,price)
    @quantity = quantity
    @total_price = calculate_total # an funqcia ar gvinda da pridapir @quantity * @price
  end
  def calculate_total
    @quantity * @price
  end
end
