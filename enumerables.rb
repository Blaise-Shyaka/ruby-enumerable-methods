module Enumerable
def my_each()
  return self unless self.kind_of? Array
  return to_enum unless block_given?
  i=0
  while i<=self.length-1
    yield(self[i])
    i+=1
  end
  return self
end

def my_each_with_index
  return to_enum unless block_given?

  object_to_return = []
  for i in 0...self.length
   object_to_return << yield(self[i], i)
  end
  return object_to_return
end

def my_select
  return to_enum unless block_given?

  object_to_return = []
  self.my_each do |element|
    object_to_return << element if yield(element)
  end
  return object_to_return
end

def my_all?(*arg, &block)
  if arg.length == 1
    if arg[0].kind_of? Class
      i=0
      while i < self.length
        return false unless self[i].kind_of? arg[0]
        i += 1
      end 
      return true
    else
      i=0
      while i < self.length
        return false if self[i] != arg
        i += 1
      end
      return true
    end
  end

  block = lambda{|obj| obj} unless block_given?
  i=0
  while i < self.length
    return false unless block.call(self[i])
    i += 1
  end
  return true
end

def my_any?(*arg, &block)
  if arg.length == 1
    if arg[0].kind_of? Class
      i=0
      while i < self.length
        return true if self[i].kind_of? arg[0]
        i += 1
      end 
      return false
    else
      i=0
      while i < self.length
        return true if self[i] == arg
        i += 1
      end
      return false
    end
  end

  block = lambda{|obj| obj} unless block_given?
  i=0
  while i < self.length
    return true if block.call(self[i])
    i += 1
  end
  return false
end

def my_none?(*arg, &block)
  return !my_any?(*arg, &block)
end

def my_count(*arg, &block)
  count = 0
  if arg.length == 1
      i=0
      while i < self.length
        count += 1 if self[i] == arg[0]
        i += 1
      end
      return count
  end
  block = lambda{|obj| obj} unless block_given?
  i=0
  while i < self.length
    count += 1 if block.call(self[i])
    i += 1
  end
  return count
end

def my_map
  res = []
  if(self.kind_of? Range)
    self.to_a.my_each {|elt| res.push(yield(elt))}
    return res
  end
   #if self.kind_of? Range
  return self unless self.kind_of? Array
  return to_enum unless block_given?
   
  #elsif (self.kind_of? Array)
  #end 
  self.my_each {|elt| res.push(yield(elt))}
  return res
end

def my_inject (*arg, &block)
  # Thow an error unless we were given an array of integers

  # Initialize a result variable to zero

  # Check if we were given one argument without a block
    # Check if it's not a symbol return

    # Check if it's only a symbol 
      # Iterate the array of elements and apply (symbol)= to the result
      # Return result variable
    # end only symbol check

  # Check if we were given two arguments without a block
    # Throw an error unless the first argument is an integer and the second is a symbol

    # Check if the first argument is an integer and the second is a symbol
      # Set the result variable equal to the first argument
      # Iterate over the array and add its elements to the result variable
      # return the result variable
    #
  
  # Check if we were given a block
    # Check if we have an argument and that the argument is an integer
      # Set the result variable equal to argument
      # Iterate over the array and add to the result variable the yield[elt]
      # return the result
    #

    # Check if we only have a block
      # Iterate over the array and add to the result variable the yield[elt]
      # return the result
    #    
end

def multiply_els
end

end

# Test #my_each
=begin 
puts [3,5,67,23,4].my_each {|el| puts el}
puts "Built-in each..."
#puts [3,5,67,23,4].each {|el,el2| puts el+el2}

# Test #my_each_with_index
puts "======= Tests for my_each_with_index ======"
puts "It should return the enumerable if no block given"
puts [1,2,3,4].my_each_with_index
puts "It should execute the code given in the block"
p [1,2,3,4].my_each_with_index { |val, index| val * index }

# Test #my_select
puts "======= Tests for my_select ======"
puts "It should return the enumerable if no block given"
puts [1,2,3,4].my_select
puts "It should execute the code given in the block"
p [1,2,3,4].my_select { |elt| elt > 2 } 
=end

# Test #my_all?
#puts [nil, true, 99].all?
#puts [1, nil, 5, 99, "g"].my_all? 
#puts [1, 4, 5, 99, "g"].all? (Numeric)
#puts [8, 4, 4, 2].all? {|elt| elt % 2 == 0}
# puts [1, 4, 5, 99, "g"].all? (Numeric, String)
#puts "Testing my all..."
#puts [1, nil, 5, 99, "g"].my_all? 
#puts [8, 4, 4, 2].my_all? {|elt| elt % 2 == 0}
#puts [1, 4, 5, 99, "g"].my_all? (Numeric)
# puts [1, 4, 5, 99, "g"].my_all? (Numeric, String)
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

=begin 
puts "Testing my_count..."
puts "count is: #{[5,3,77].count(3)}"
puts "my_count is: #{[5,3,77].my_count(3)}"
puts "count is: #{[5,3,77,1].count do |elt| elt > 1 end}"
puts "my_count is: #{[5,3,77,1].my_count do |elt| elt > 1 end}"
puts [7, 5, 1, 5].count {|elt| elt.kind_of? Numeric}
puts [7, 5, 1, 5].my_count {|elt| elt.kind_of? Numeric} 
=end

# puts "Testing my_map..."
# puts "map is: #{(1..4).map do |i| i*i end}"
# puts "my_map is: #{(1..4).my_map do |i| i*i end }"

# puts "map is: #{[5,3,77,1].map}"
# puts "my_map is: #{[5,3,77,1].my_map}"
#puts "map is: #{[1..4].each do |i| i*i end}"
#puts "my_map is: #{[1..4].my_each do |i| i*i end }"
# puts "map is: #{[1,2,3,4].map do |i| i*i end}"
# puts "my_map is: #{[1,2,3,4].my_map do |i| i*i end}"
# puts "With strings..."
#puts "map is: #{"something".map do |i| i*i end}"
#puts "my_map is: #{"something".my_map do |i| i*i end}"
#puts "map is: #{"Hello".map}"
#puts "my_map is: #{'Hello'.my_map}"

puts "======= Testing my_inject"
puts "Inject on an array of integers with an accumulator #{[1,2,3,4].inject do |acc, elt| acc * elt end}"
puts "Inject with an accumulator #{[1,2,3,4].inject(5) do |acc, elt| acc * elt end}"
puts "Inject with a symbol and an initial value #{[1,2,3,4].inject(5, :+)}"
puts "Inject with a symbol without initial value #{[1,2,3,4].inject(:+)}"
puts "Inject with a symbol without initial value #{[1,2,3,4].inject(:+)}"
puts "Inject with a symbol without initial value #{["a", "b", "c"].inject("d", :*)}"
puts "Inject with an array as initial value and a symbol as a second argument #{[1,2,4].inject([3,4], :*)}" #(returns the argument array the number of times equal to the reduce value)
puts "Inject on a string with an accumulator #{"line".inject("simple") do |acc, elt| acc * elt end}" #Returns a NoMethodError
puts "Inject on a string with a symbol without initial value #{"line".inject(:+)}" #Returns a NoMethodError
#puts "Inject without a block and argument #{[1,2,3,4].inject}" (Return Local JumpError no block given)
#puts "My_inject with an integer as initial value #{[1,2,3,4].inject(4)}" (Return TypeError)
#puts "My_inject with an array as initial value #{[1,2,3,4].inject([3,4,5,6])}" (Return a TypeError)
#puts "Inject with a hash  without an accumulator:" print {score1: 5, score2: 3, score3: 10}.inject do |10, elt| elt + 5 end
#puts "Inject with a hash  without an accumulator:" print {score1: 5, score2: 3, score3: 10}.inject do |elt| elt + 5 end
