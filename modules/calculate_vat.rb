module Vat
  Percent = 18
  def calculate_vat(number)
    number = number * Percent / 100
  end
end