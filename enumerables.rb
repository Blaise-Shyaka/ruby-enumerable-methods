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
  if !block_given?
      return "Error" unless self.kind_of? Array
      result=0
      
      if arg.length == 1
          return "Arg[0] is not a Symbol..." unless arg[0].kind_of? Symbol # Check if it's only a symbol 
          our_sym=arg[0].to_s[0]
          result = self[0]
          i=1

          while i<self.length
              result=result.send(our_sym,self[i])
              i+=1
          end
          
          return result
      end
      if arg.length == 2
          our_sym = arg[1].to_s[0]
          result = arg[0]
          i=0
          while i<self.length
            result=result.send(our_sym,self[i])
              i+=1
          end
          return result
      end
  end
end

def multiply_els
end

end

puts [1,2,3,4].inject(:%)
puts [1,2,3,4].my_inject(:%)
puts [1,2,3,4].inject(5, :/)
puts [1,2,3,4].my_inject(5, :/)