require_relative 'taxable'
require 'test/unit'

class Taxabletest < Test::Unit::TestCase
  include Taxable
  def test_integer_number
    assert_equal(18,calculate_tax(100))
  end
  def test_float_number
    assert_equal(18.0,calculate_tax(100.0))
  end
  def test_negative_number
    assert_equal(-18.0,calculate_tax(-100.0))
  end
  def test_zero
    assert_equal(0,calculate_tax(0))
  end
end
