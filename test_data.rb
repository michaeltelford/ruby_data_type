require "minitest/autorun"
require "byebug"
require "data"

class TestMyApp < Minitest::Test
  def test_data
    measure = Data.define(:amount, :unit)
    assert_instance_of Class, measure
    
    m = measure.new(1, "km")
    assert_instance_of measure, m
    
    m = measure.new(amount: 1, unit: "km")
    assert_instance_of measure, m
    
    assert_equal 1, m.amount
    assert_equal "km", m.unit
  end
  
  def test_immutability
    measure = Data.define(:amount, :unit)
    m = measure.new(1, "km")
    
    assert_err(err: NoMethodError) { m.amount = 5 }
  end
  
  def test_argument_errors
    measure = Data.define(:amount, :unit)
    
    assert_arg_err { measure.new }
    assert_arg_err { measure.new(1) }
    assert_arg_err { measure.new(amount: 1) }
    assert_arg_err { measure.new(1, "km", "h") }
    assert_arg_err { measure.new(amount: 1, unit: "km", comment: "slow") }
  end
  
  private
  
  def assert_arg_err(msg: nil, &block)
    assert_err(err: ArgumentError, msg: msg, &block)
  end
  
  def assert_err(err: StandardError, msg: nil, &block)
    block.call
    flunk "expected to raise #{err}"
  rescue StandardError => err
    if msg && msg != err
      flunk "wrong error message"
    end
    pass
  end
end
