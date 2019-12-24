module Taxable
  Percent = 18
  def calculate_tax(number)
    number = number * Percent / 100
  end
end
