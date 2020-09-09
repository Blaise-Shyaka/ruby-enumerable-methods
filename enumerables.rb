module Enumerable
def my_each()
  return "Error" unless block_given?

  #puts "For started..."
  i=0
  res=[]
  while i<=self.length-1 #for i in 0..(self.length-2)
    #puts "i is: #{i}"
    res.push(yield(self[i]))
    #puts i
    i+=1
  end
  return res
  #puts "For ended..."

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
#args = Proc.new={|obj| obj}
def my_all?(*arg, &block)
  if arg.length == 1
    i=0
    while i < self.length
      return false if self[i] != arg
      i += 1
    end
  end

  block = lambda{|obj| obj} unless block_given?
  i=0
  while i < self.length
    return false if !block.call(self[i])
    i += 1
  end
  return true
end

def my_any?
end
def my_none?
end
def my_count
end
def my_map
end
def my_inject
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
puts [nil, true, 99].all?
puts [1, nil, 5, 99, "g"].my_all? 
puts [1, 4, 5, 99, "g"].all? (Numeric)
puts [8, 4, 4, 2].all? {|elt| elt % 2 == 0}
puts [1, 4, 5, 99, "g"].all? (Numeric, String)
puts "Testing my all..."
puts [1, nil, 5, 99, "g"].my_all? 
puts [8, 4, 4, 2].my_all? {|elt| elt % 2 == 0}
puts [1, 4, 5, 99, "g"].my_all? (Numeric)
puts [1, 4, 5, 99, "g"].my_all? (Numeric, String)