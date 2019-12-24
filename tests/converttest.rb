require_relative 'convert'
require_relative 'product'
require_relative 'product_full_data'
require 'test/unit'

class Converttest < Test::Unit::TestCase
  include Convert
  def test_empty_array
    assert_equal([],convert([],{10 => 5}))
  end
  def test_empty_hash
    assert_equal([Fulldata.new(10,"galaxsy s10","magaria",2000,3)],convert([Product.new(10,"galaxsy s10","magaria",2000)],{10 => 3,12 =>1}))
  end
end
