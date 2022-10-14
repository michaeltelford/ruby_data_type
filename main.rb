require_relative "data"
require "byebug"

if __FILE__ == $0
  # If using inside a function, use a lower case identifer e.g. measure.
  Measure = Data.define(:amount, :unit)
  m = Measure.new(amount: 1, unit: "km") # OR: m = Measure.new(1, "km")
  # m.amount = 5 => NoMethodError
  puts "#{m.amount} #{m.unit}" # => 1 km
  
  MutMeasure = Data.define(:amount, :unit, immutable: false)
  m = MutMeasure.new(amount: 1, unit: "km")
  m.amount = 5
  puts "#{m.amount} #{m.unit}" # => 5 km
  
  # => ArgumentError
  # Measure.new
  # Measure.new(1)
  # Measure.new(amount: 1)
  # Measure.new(1, "km", "h")
  # Measure.new(amount: 1, unit: "km", comment: "slow")
end
