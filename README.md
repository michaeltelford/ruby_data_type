# Ruby Data Type

Recently, a new `Data` type was introduced to Ruby (see [here](https://dev.to/baweaver/new-in-ruby-32-datadefine-2819) for more info), written in C. I decided to implement my own version of this immutable Data type in pure Ruby, just for fun. This repo is the result of that experiment.

One major difference between the built in `Data` type and my own, is that mine has configurable immutability, defaulting to immutable.

## Usage

Excerpt taken from `main.go`:

```ruby
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
```

Output:

```sh
1 km
5 km
```

## Motivation

The built-in `Data` type is similar in nature to a Struct but unlike a Struct it's immutable; which is safer in most scenarios. My version is immutable by default, but allows opt-in mutability for flexibility.

Trying to implement this sort of dynamic concept in another language would likely be very difficult but Ruby's dynamic features lend itself to this type of PoC, and is fun to try out!

## Future

In the future I may package this code into a gem, who knows... :-)
