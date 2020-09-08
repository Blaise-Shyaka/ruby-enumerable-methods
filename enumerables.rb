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
  puts "Hello"
end

def my_select
end
def my_all?
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

# Test 1
puts [3,5,67,23,4].my_each {|el| puts el}
puts "Built-in each..."
puts [3,5,67,23,4].each {|el,el2| puts el+el2}