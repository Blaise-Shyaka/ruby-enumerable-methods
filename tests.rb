require_relative 'enumerables.rb'

# puts "======= Tests for my_each ======"
# puts [3,5,67,23,4].my_each {|el,el2| puts el+el2}
# puts "Built-in each: "
# [ "a", "b", "c" ].each {|x| print x, " -- " }
# puts ""
# puts "my_each: "
# [ "a", "b", "c" ].my_each {|x| print x, " -- " }
# puts ""
# puts [3,5,67,23,4].each {|el,el2| puts el+el2} # Fails, nil can't be coerced into Integer
# puts [3,5,67,23,4].my_each {|el,el2| puts el+el2} # Fails, nil can't be coerced into Integer (same as each)

 puts "======= Tests for my_each_with_index ======"
 puts "It should return the enumerable if no block given"
 puts "Built-in each_with_index..."
 puts [1,2,3,4].each_with_index
 puts "Our my_each_with_index..."
 puts [1,2,3,4].my_each_with_index
 puts "It should execute the code given in the block"
 puts "Built-in each_with_index..."
 puts [1,2,3,4].each_with_index { |val, index| val * index }
 puts "Our my_each_with_index..."
 puts [1,2,3,4].my_each_with_index { |val, index| val * index }
 puts "Now, with a hash..."
 puts "Built-in each_with_index"
 hash = Hash.new
puts %w(cat dog wombat).each_with_index { |item, index|
  hash[item] = index
}
puts hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}
 puts "Our my_each_with_index"
 hash = Hash.new
 puts %w(cat dog wombat).my_each_with_index { |item, index|
   hash[item] = index
 }
 puts hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}

# Test #my_select
# puts "======= Tests for my_select ======"
# puts "It should return the enumerable if no block given"
# puts [1,2,3,4].my_select
# puts "It should execute the code given in the block"
# p [1,2,3,4].my_select { |elt| elt > 2 } 

# Test #my_all?
# puts [nil, true, 99].all?
# puts [1, nil, 5, 99, "g"].my_all? 
# puts [1, 4, 5, 99, "g"].all? (Numeric)
# puts [8, 4, 4, 2].all? {|elt| elt % 2 == 0}
# #puts [1, 4, 5, 99, "g"].all? (Numeric, String)
# puts "Testing my all..."
# puts [1, nil, 5, 99, "g"].my_all? 
# puts [8, 4, 4, 2].my_all? {|elt| elt % 2 == 0}
# puts [1, 4, 5, 99, "g"].my_all? (Numeric)
# #puts [1, 4, 5, 99, "g"].my_all? (Numeric, String)
# puts "all? is: #{[5,3,6].all?(Block)}"
# puts "my_all? is: #{[5,3,77].my_all?(Block)}"

# puts "Testing my any..."
# puts "any? is: #{[5,3,77].any?(Numeric)}"
# puts "my_any? is: #{[5,3,77].my_any?(Numeric)}"
# puts "any? is: #{[5,3,77,"f"].any?(String)}"
# puts "my_any? is: #{[5,3,77,"f"].my_any?(String)}"
# puts [7, 5, 1, 5].any? {|elt| elt % 2 == 0}
# puts [7, 5, 1, 5].my_any? {|elt| elt % 2 == 0}

# puts "Testing my_any..."
# puts "none? is: #{[5,3,77].none?(Numeric)}"
# puts "my_none? is: #{[5,3,77].my_none?(Numeric)}"
# puts "none? is: #{[5,3,77,"f"].none?(String)}"
# puts "my_none? is: #{[5,3,77,"f"].my_none?(String)}"
# puts [7, 5, 1, 5].none? {|elt| elt % 2 == 0}
# puts [7, 5, 1, 5].my_none? {|elt| elt % 2 == 0}
# puts "Testing my_count..."
# puts "count is: #{[5,3,77].count(3)}"
# puts "my_count is: #{[5,3,77].my_count(3)}"
# puts "count is: #{[5,3,77,1].count do |elt| elt > 1 end}"
# puts "my_count is: #{[5,3,77,1].my_count do |elt| elt > 1 end}"
# puts [7, 5, 1, 5].count {|elt| elt.kind_of? Numeric}
# puts [7, 5, 1, 5].my_count {|elt| elt.kind_of? Numeric} 

# puts "Testing my_map..."
# puts "map is: #{(1..4).map do |i| i*i end}"
# puts "my_map is: #{(1..4).my_map do |i| i*i end }"

# puts "map is: #{[5,3,77,1].map}"
# puts "my_map is: #{[5,3,77,1].my_map}"
# puts "map is: #{[1..4].each do |i| i*i end}"
# puts "my_map is: #{[1..4].my_each do |i| i*i end }"
# puts "map is: #{[1,2,3,4].map do |i| i*i end}"
# puts "my_map is: #{[1,2,3,4].my_map do |i| i*i end}"
# puts "With strings..."
# puts "map is: #{"something".map do |i| i*i end}"
# puts "my_map is: #{"something".my_map do |i| i*i end}"
# puts "map is: #{"Hello".map}"
# puts "my_map is: #{'Hello'.my_map}"

# puts "Testing my_map with a proc..."
# my_proc = Proc.new {|el| el/=2}
# puts [1,3,5].map(&my_proc)
# puts "My_map with a proc..."
# puts [1,3,5].my_map(&my_proc)
# puts "======= Testing my_inject"
# puts "Inject on an array of integers with an accumulator #{[1,2,3,4].inject do |acc, elt| acc * elt end}"
# puts "Inject with an accumulator #{[1,2,3,4].inject(5) do |acc, elt| acc * elt end}"
# puts "Inject with a symbol and an initial value #{[1,2,3,4].inject(5, :+)}"
# puts "Inject with a symbol without initial value #{[1,2,3,4].inject(:+)}"
# puts "Inject with a symbol without initial value #{[1,2,3,4].inject(:+)}"
# puts "Inject with a symbol without initial value #{["a", "b", "c"].inject("d", :*)}"
# puts "Inject with an array as initial value and a symbol as a second argument #{[1,2,4].inject([3,4], :*)}" # # NOT SOLVED YET (returns the argument array the number of times equal to the reduce value)
# puts "Inject with an array as initial value and a symbol as a second argument #{[1,2,4].my_inject([3,4], :*)}"
# puts "Inject on a string with an accumulator #{"line".inject("simple") do |acc, elt| acc * elt end}" #Returns a NoMethodError
# puts "Inject on a string with a symbol without initial value #{"line".inject(:+)}" #Returns a NoMethodError
# #puts "Inject without a block and argument #{[1,2,3,4].inject}" (Return Local JumpError no block given)
# #puts "My_inject with an integer as initial value #{[1,2,3,4].inject(4)}" (Return TypeError)
# #puts "My_inject with an array as initial value #{[1,2,3,4].inject([3,4,5,6])}" (Return a TypeError)
# # puts "Inject with a hash  without an accumulator:" print {score1: 5, score2: 3, score3: 10}.inject do |10, elt| elt + 5 end
# # puts "Inject with a hash  without an accumulator:" print {score1: 5, score2: 3, score3: 10}.inject do |elt| elt + 5 end
# # puts "Inject on a string with a symbol without initial value #{[1,2,3,4].my_inject(:+)}" #Returns a NoMethodError
# puts [1,2,3,4].inject(:%)
# puts [1,2,3,4].my_inject(:%)
# puts [1,2,3,4].inject(5, :*)
# puts [1,2,3,4].my_inject(5, :*)
# puts [1,2,3,4].inject(5, :/)
# puts [1,2,3,4].my_inject(5, :/)
#puts [1,2,3,4].inject(5, 3, :/)
#puts "Testing my_inject with three arguments..."
#puts [1,2,3,4].my_inject(5, 3, :/)
#puts [1,2,3,4].my_inject()
#puts [1,2,3,4].inject {|acc, elt| acc-= elt }
#puts [1,2,3,4].my_inject { |acc, elt| acc-= elt } 
#puts ["a", "b", "c", "d"].inject {|acc, elt| acc+= elt }
#puts ["a", "b", "c", "d"].my_inject { |acc, elt| acc+= elt } 
#puts "Testing my inject with a block and a single argument..."
#puts [1,2,3,4].inject([1]) { |acc,el| acc%=el }
#puts [1,2,3,4].my_inject([1]) { |acc,el| acc%=el }

# puts "Testing with multiply_els..."
# puts multiply_els([2,4,7,5])