require_relative "data"
require "byebug"

if __FILE__ == $0
  # If using inside a function, use a lower case identifer.
  Measure = Data.define(:amount, :unit)
  
  # m = Measure.new(1, "km")
  # -- OR --
  m = Measure.new(amount: 1, unit: "km")
  
  puts "#{m.amount} #{m.unit}"
  
  # => ArgumentError
  # Measure.new
  # Measure.new(1)
  # Measure.new(amount: 1)
  # Measure.new(1, "km", "h")
  # Measure.new(amount: 1, unit: "km", comment: "slow")
end
