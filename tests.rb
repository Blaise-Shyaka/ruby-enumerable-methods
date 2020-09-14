require_relative 'enumerables.rb'

# puts "======= Tests for my_each ======"
# puts "Built-in each: "
# ["a", "b", "c"].each { |x| print x, " -- " }
# puts ""
# puts "my_each: "
# [ "a", "b", "c" ].my_each { |x| print x, " -- " }
# puts ""
# puts "Built-in each: "
# puts [3, 5, 67, 23, 4].each {|el,el2| puts el+el2} # Fails, nil can't be coerced into Integer
# puts "Our my_each: "
# puts [3, 5, 67, 23, 4].my_each {|el,el2| puts el+el2} # Fails, nil can't be coerced into Integer (same as each)
# puts "Built-in each: "
# new_proc = proc { |num| num < (0 + 9) / 2 }
# puts Range.new(5, 50).each(&new_proc)
# puts "Our each ..."
# new_proc = proc { |num| num < (0 + 9) / 2 }
# puts Range.new(5, 50).my_each(&new_proc)
# puts "With each..."
# puts "Built-in each: for hashes"
# puts "When the block has zero parameters"
# my_hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# puts my_hash.each { 
#     puts "Without parameter..."
# }
# puts "Our each ... for hashes"
# my_hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# puts my_hash.my_each {
#     puts "Without parameter..."
# }
# puts "When the block has one parameter"
# my_hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# puts my_hash.each { |key|
#     puts "Key is: #{key*2}"
# }
# puts "Our each ... for hashes"
# my_hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# puts my_hash.my_each { |key|
#     puts "Key is: #{key*2}"
# }
# puts "When the block has two parameters"
# my_hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# puts my_hash.each { |key, value|
#     puts "Key is: #{key}, value is: #{value*2}"
# }
# puts "Our each ... for hashes"
# my_hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# puts my_hash.my_each { |key, value|
# puts "Key is: #{key}, value is: #{value*2}"
# }

# puts "With a for loop..."
# for i in 0...my_hash.length - 1
#    {|key, value| puts key }
# end


# puts "======= Tests for my_each_with_index ======"
# puts "It should return the enumerable if no block given"
# puts "Built-in each_with_index..."
# puts [1, 2, 3, 4].each_with_index
# puts "Our my_each_with_index..."
# puts [1, 2, 3, 4].my_each_with_index
# puts "It should execute the code given in the block"
# puts "Built-in each_with_index..."
# puts [1, 2, 3, 4].each_with_index { |val, index| val * index }
# puts "Our my_each_with_index..."
# puts [1, 2, 3, 4].my_each_with_index { |val, index| val * index }
# puts "Now, with a hash..."
# puts "Built-in each_with_index"
# hash = Hash.new
# puts %w[cat dog wombat].each_with_index { |item, index|
# hash[item] = index }
#
# puts hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}
# puts "Our my_each_with_index"
# hash = Hash.new
# puts %w[cat dog wombat].my_each_with_index { |item, index|
# hash[item] = index
# }
# puts hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}

# puts "======= Tests for my_select ======"
# puts "It should return the enumerable if no block given"
# puts "Built-in select"
# puts [1, 2, 3, 4].select
# puts "Our my_select"
# puts [1, 2, 3, 4].my_select
# puts "It should execute the code given in the block"
# puts "Built-in select"
# puts [1, 2, 3, 4].select { |elt| elt > 2 }
# puts "Our my_select"
# puts [1, 2, 3, 4].my_select { |elt| elt > 2 }
# puts "More tests: It should select the elements that satisfy the condition in the block"
# puts "Built-in select"
# puts (1..10).select { |i|  i % 3 == 0 }   #=> [3, 6, 9]
# puts [1, 2, 3, 4, 5].select { |num|  num.even?  }   #=> [2, 4]
# puts [:foo, :bar].select{ |x| x == :foo }   #=> [:foo]
# puts "Our my_select"
# puts (1..10).my_select { |i|  i % 3 == 0 }   #=> [3, 6, 9]
# puts [1, 2, 3, 4, 5].my_select { |num|  num.even?  }   #=> [2, 4]
# puts [:foo, :bar].my_select{ |x| x == :foo }   #=> [:foo]

# puts "======= Tests for my_all ======"
# puts "Built-in all?"
# puts [nil, true, 99].all?
# puts "Our my_all?"
# puts [nil, true, 99].my_all?
# puts "Built-in all?"
# puts [1, 4, 5, 99, "g"].all? (Numeric)
# puts "Our my_all?"
# puts [1, 4, 5, 99, "g"].my_all? (Numeric)
# puts "Built-in all?"
# puts [8, 4, 4, 2].all? {|elt| elt % 2 == 0}
# puts "Our my_all?"
# puts [8, 4, 4, 2].my_all? {|elt| elt % 2 == 0}
# puts "Built-in all?"
# puts %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].all?(/t/)                        #=> false
# puts [1, 2i, 3.14].all?(Numeric)                       #=> true
# puts [nil, true, 99].all?                              #=> false
# puts [].all?                                           #=> true
# puts "Our my_all?"
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].my_all?(/t/)                        #=> false
# puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# puts [nil, true, 99].my_all?                              #=> false
# puts [].my_all?                                           #=> true
# puts "Built-in all?"
# puts [1, 4, 5, 99, "g"].all? (Numeric, String) #They throw an error
# puts "Our my_all?"
# puts [1, 4, 5, 99, "g"].my_all? (Numeric, String) #They throw an error
# puts "Built-in all?"
# puts "all? is: #{[5, 3, 6].all?(Block)}" #They throw a NameError
# puts "Our my_all?"
# puts "all? is: #{[5, 3, 6].my_all?(Block)}" #They throw a NameError

# puts "======= Tests for my_any ======"
# puts "Built-in any?"
# puts "any? is: #{[5,3,77].any?(Numeric)}"
# puts "Our my_any?"
# puts "my_any? is: #{[5, 3, 77].my_any?(Numeric)}"
# puts "Built-in any?"
# puts "any? is: #{[5, 3, 77, "f"].any?(String)}"
# puts "Our my_any?"
# puts "my_any? is: #{[5, 3, 77, "f"].my_any?(String)}"
# puts "Built-in any?"
# puts [7, 5, 1, 5].any? {|elt| elt % 2 == 0}
# puts "Our my_any?"
# puts [7, 5, 1, 5].my_any? {|elt| elt % 2 == 0}
# puts "Built-in any?"
# puts %w[ant bear cat].any? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].any? { |word| word.length >= 4 } #=> true
# puts %w[ant bear cat].any?(/d/)                        #=> false
# puts "==== testing integers for built-in any"
# puts %w[ant bear cat].any?(Integer)                    #=> false
# puts [nil, true, 99].any?(Integer)                     #=> true
# puts [nil, true, 99].any?                              #=> true
# puts [].any?                                           #=> false
# puts "Our my_any?"
# puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# puts %w[ant bear cat].my_any?(/d/)                        #=> false
# puts "==== testing integers for my_any"
# puts %w[ant bear cat].my_any?(Integer)                    #=> false
# puts [nil, true, 99].my_any?(Integer)                     #=> true
# puts [nil, true, 99].my_any?                           #=> true
# puts [].my_any? #=> false

# puts "======= Tests for my_any ======"
# puts "Built-in none?"
# puts "none? is: #{[5, 3, 77].none?(Numeric) }"
# puts "Our my_none?"
# puts "my_none? is: #{[5, 3, 77].my_none?(Numeric) }"
# puts "Built-in none?"
# puts "none? is: #{[5, 3, 77, "f"].none?(String) }"
# puts "Our my_none?"
# puts "my_none? is: #{[5, 3, 77, "f"].my_none?(String) }"
# puts "Built-in none?"
# puts [7, 5, 1, 5].none? {|elt| elt % 2 == 0 }
# puts "Our my_none?"
# puts [7, 5, 1, 5].my_none? {|elt| elt % 2 == 0 }
# puts "Built-in none?"
# puts %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
# puts %w{ ant bear cat }.none? { |word| word.length >= 4 } #=> false
# puts %w{ ant bear cat }.none?(/d/)                        #=> true
# puts [1, 3.14, 42].none?(Float)                         #=> false
# puts [].none?                                           #=> true
# puts [nil].none?                                        #=> true
# puts [nil, false].none?                                 #=> true
# puts [nil, false, true].none?                           #=> false
# puts "Our my_none?"
# puts %w{ant bear cat }.my_none? { |word| word.length == 5 } #=> true
# puts %w{ant bear cat }.my_none? { |word| word.length >= 4 } #=> false
# puts %w{ant bear cat }.my_none?(/d/)                        #=> true
# puts [1, 3.14, 42].my_none?(Float)                         #=> false
# puts [].my_none?                                           #=> true
# puts [nil].my_none?                                        #=> true
# puts [nil, false].my_none?                                 #=> true
# puts [nil, false, true].my_none?                           #=> false

# puts "======= Tests for my_count ======"
# puts "Built-in count"
# puts [5, 3, 77].count(3)
# puts "Our count"
# puts [5, 3, 77].my_count(3)
# puts "Built-in count"
# puts [5, 3, 77, 1].count { |elt| elt > 1 }
# puts "Our count"
# puts [5, 3, 77, 1].my_count { |elt| elt > 1 }
# puts "Built-in count"
# puts [7, 5, 1, 5].count {|elt| elt.kind_of? Numeric}
# puts "Our count"
# puts [7, 5, 1, 5].my_count {|elt| elt.kind_of? Numeric}
# puts "Built-in count"
# puts [1, 2, 4, 2].count               #=> 4
# puts [1, 2, 4, 2].count(2)            #=> 2
# puts [1, 2, 4, 2].count{ |x| x%2==0 } #=> 3
# puts "Our count"
# puts [1, 2, 4, 2].my_count               #=> 4
# puts [1, 2, 4, 2].my_count(2)            #=> 2
# puts [1, 2, 4, 2].my_count{ |x| x%2==0 } #=> 3

# pputs "======= Tests for my_map ======"
# puts "When we pass a block and a range as an argument"
# puts "Built-in map"
# puts (1..4).map { |i| i*i }
# puts "Our my_map"
# puts (1..4).my_map { |i| i*i }
# puts "When we don't pass anything"
# puts "Built-in map"
# puts [5, 3, 77, 1].map
# puts "Our my_map"
# puts [5, 3, 77, 1].my_map
# puts "When we pass a Range within an Array and a block" # They fail the same way
# puts "Built-in map"
# puts [1..4].map { |i| i*i }
# puts "Our my_map"
# puts [1..4].my_map { |i| i*i }
# puts "When we pass an Array and a Block"
# puts "Built-in map"
# puts [1, 2, 3, 4].map { |i| i*i }
# puts "Our my_map"
# puts [1, 2, 3, 4].my_map { |i| i*i }
# puts "With strings..." # They fail the same way
# puts "Built-in map"
# puts "something".map { |i| i*i }
# puts "Our my_map"
# puts "something".my_map { |i| i*i }
# puts "With a string and no arguments" # They fail the same way
# puts "Built-in map"
# puts "Hello".map
# puts "Our my_map"
# puts "Hello".my_map
# puts "Now, with a proc..."
# my_proc = Proc.new {|el| el/=2 }
# puts "Built-in map"
# puts [1, 3, 5].map(&my_proc)
# puts "Our my_map"
# puts [1, 3, 5].my_map(&my_proc)
# puts "More tests..."
# puts "Built-in map"
# puts (1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
# puts (1..4).map { "cat" }   #=> ["cat", "cat", "cat", "cat"]
# puts "Our my_map"
# puts (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
# puts (1..4).my_map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]

# puts"======= Testing my_inject==========="

# puts"Built-in inject"
# puts[1, 2, 3, 4].inject { |acc, elt| acc * elt }
# puts"Our my_inject"
# puts[1, 2, 3, 4].my_inject { |acc, elt| acc * elt }
# puts"Built-in inject"
# puts[1, 2, 3, 4].inject(5) { |acc, elt| acc * elt }
# puts"Our my_inject"
# puts[1, 2, 3, 4].my_inject(5) { |acc, elt| acc * elt }
# puts"Built-in inject"
# puts[1, 2, 3, 4].inject(5, :+)
# puts"Our my_inject"
# puts[1, 2, 3, 4].my_inject(5, :+)
# puts"Built-in inject"
# puts[1, 2, 3, 4].inject(:+)
# puts"Our my_inject"
# puts[1, 2, 3, 4].my_inject(:+)
# puts"Built-in inject"
# puts["a", "b", "c"].inject("d", :*) # Returns TypeError
# puts"Our my_inject"
# puts ["a", "b", "c"].my_inject("d", :*) # Returns TypeError
# puts "Built-in inject"
# puts [1, 2, 4].inject([3,4], :*) # Returns the argument array the number of times equal to the reduced value)
# puts "Our my_inject"
# puts [1, 2, 4].my_inject([3,4], :*)
# puts "Built-in inject"
# puts {score1: 5, score2: 3, score3: 10}.inject { |elt| elt + 5 }
# puts "Our my_inject"
# puts {score1: 5, score2: 3, score3: 10}.my_inject { |elt| elt + 5 }
# puts "Built-in inject"
# puts ["a", "b", "c", "d"].inject { |acc, elt| acc += elt }
# puts "Our my_inject"
# puts ["a", "b", "c", "d"].my_inject { |acc, elt| acc += elt }
# puts "Built-in inject"
# puts (5..10).inject { |sum, n| sum + n }            #=> 45
# puts (5..10).inject(1) { |product, n| product * n } #=> 151200
# longest = %w{ cat sheep bear }.inject do |memo, word|
# memo.length > word.length ? memo : word
# end
# puts longest                                        #=> "sheep"
# puts "Our my_inject"
# puts (5..10).my_inject { |sum, n| sum + n }            #=> 45
# puts (5..10).my_inject(1) { |product, n| product * n } #=> 151200
# longest = %w{ cat sheep bear }.inject do |memo, word|
# memo.length > word.length ? memo : word
# end
# puts longest #=> "sheep"
# puts "Built-in inject"
# puts "line".inject("simple") { |acc, elt| acc * elt} " #Returns a NoMethodError
# puts "Our my_inject"
# puts "line".my_inject("simple") { |acc, elt| acc * elt} " #Returns a NoMethodError
# puts "Built-in inject"
# puts "line".inject("simple") { |acc, elt| acc * elt} " #Returns a NoMethodError
# puts "Our my_inject"
# puts "line".my_inject("simple") { |acc, elt| acc * elt} " #Returns a NoMethodError
# puts "Built-in inject"
# puts "line".inject("simple") { |acc, elt| acc * elt} " #Returns a NoMethodError
# puts "Our my_inject"
# puts "line".my_inject("simple") { |acc, elt| acc * elt} " #Returns a NoMethodError
# puts "Built-in inject"
# puts "line".inject(:+)" #Returns a NoMethodError
# puts "Our my_inject"
# puts "line".my_inject(:+)" #Returns a NoMethodError
# puts "Built-in inject"
# puts [1, 2, 3, 4].inject (Returns Local JumpError no block given)
# puts "Our my_inject"
# puts [1, 2, 3, 4].my_inject (Returns Local JumpError no block given)
# puts "Built-in inject"
# puts [1, 2, 3, 4].inject(4) (Returns TypeError)
# puts "Our my_inject"
# puts [1, 2, 3, 4].my_inject(4) (Returns TypeError)
# puts "Built-in inject"
# puts [1, 2, 3, 4].inject([3, 4, 5, 6]) (Returns a TypeError)
# puts "Our my_inject"
# puts [1, 2, 3, 4].inject([3, 4, 5, 6]) (Returns a TypeError)
# puts "Testing with multiply_els..."
# puts multiply_els([2, 4, 7, 5])
