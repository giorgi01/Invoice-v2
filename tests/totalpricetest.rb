require_relative 'products_total_price'
require 'test/unit'

class Total_price_test < Test::Unit::TestCase
  include Calculator
  def test_emty_array
    assert_equal(0,products_total_price([]))
  end
  def test_corect
    assert_equal(1000,products_total_price([Fulldata.new(10,"asda","asdad",100,4),Fulldata.new(12,"asda","adad",200,3)]))
  end
end
