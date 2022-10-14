# Ruby Data Type

Recently, a new Data type was introduced to Ruby (see [here](https://dev.to/baweaver/new-in-ruby-32-datadefine-2819) for more info), written in C. I decided to implement my own version of this immutable data type in pure Ruby, just for fun. This repo is the result of that experient.

## Usage

Exerp taken from `main.go`:

```ruby
# If using inside a function, use a lower case identifer.
Measure = Data.define(:amount, :unit)
  
# m = Measure.new(1, "km")
# -- OR --
m = Measure.new(amount: 1, unit: "km")

puts "#{m.amount} #{m.unit}" # => "1 km"

# => ArgumentError
# Measure.new
# Measure.new(1)
# Measure.new(amount: 1)
# Measure.new(1, "km", "h")
# Measure.new(amount: 1, unit: "km", comment: "slow")
```

## Motivation

This Data type is similar in nature to a Struct but unlike a Struct it's immutable; which is safer in most scenarios.

Trying to implement this sort of dynamic concept in another language would likely be very difficult but Ruby's dynamic features lend itself to this type of PoC, and is fun to try out!
