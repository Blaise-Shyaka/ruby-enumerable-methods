module Enumerable
  def my_each()
    return self unless self.is_a? Array

    return to_enum unless block_given?

    i = 0
    while i <= self.length - 1
      yield(self[i])
      i += 1
    end
    return self
  end

  def my_each_with_index
    return to_enum unless block_given?

    i=0
    while i < self.length
      yield(self[i], i)
      i+=1
    end
    return self
  end

  def my_select
    return to_enum unless block_given?

    object_to_return = []
    if(self.is_a? Range)
      self.to_a.my_each { |elt| object_to_return.push(elt) if yield(elt) }
      return object_to_return
    end
    self.my_each do |element|
      object_to_return << element if yield(element)
    end
    return object_to_return
  end

  def my_all?(*arg, &block)
    if arg.length == 1
      i = 0
      if arg[0].is_a? Class
        while i < self.length
          return false unless self[i].is_a? arg[0]

          i += 1
        end 
        return true
      else
        while i < self.length
          return false if self[i] != arg

          i += 1
        end
      end
      return true
    end
    block = lambda { |obj| obj } unless block_given?

    i = 0
    while i < self.length
      return false unless block.call(self[i])

      i += 1
    end
    return true
  end

  def my_any?(*arg, &block)
    if arg.length == 1
      i = 0
      if arg[0].is_a? Class
        while i < self.length
          return true if self[i].is_a? arg[0]

          i += 1
        end
        return false
      else
        i = 0
        while i < self.length
          return true if self[i] == arg

          i += 1
        end
      end
      return false
    end
    block = lambda { |obj| obj } unless block_given?

    i = 0
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
      i = 0
      while i < self.length
        count += 1 if self[i] == arg[0]
        i += 1
      end
      return count
    end
    block = lambda { |obj| obj } unless block_given?

    i = 0
    while i < self.length
      count += 1 if block.call(self[i])
      i += 1
    end
    return count
  end

  def my_map
    res = []
    if self.is_a? Range
      self.to_a.my_each { |elt| res.push(yield(elt)) }
      return res
    end
    return self unless self.is_a? Array

    return to_enum unless block_given?

    self.my_each { |elt| res.push(yield(elt)) }
    return res
  end

  def my_inject(*arg)
    return raise ArgumentError.new "wrong number of arguments (given #{arg.length}, expected 0..2)" unless arg.length < 3

    return 'Error' unless (self.is_a? Array) || (self.is_a? Range)

    result = 0
    if !block_given?

      if self.is_a? Range
        return self
      end

      if arg.length == 1
        return 'Arg[0] is not a Symbol...' unless arg[0].is_a? Symbol # Check if it's only a symbol

        our_sym = arg[0].to_s[0]
        result = self[0]
        i = 1
        while i < self.length
          result = result.send(our_sym, self[i])
          i += 1
        end
        return result
      end
      if arg.length == 2
        our_sym = arg[1].to_s[0]
        result = arg[0]
        i = 0
        while i < self.length
          result = result.send(our_sym, self[i])
          i += 1
        end
        return result
      end
    elsif block_given?
      if (arg.length == 1) && (arg[0].is_a? Integer)
        if self.is_a? Range
          result = self.to_a
          acc = result[0]
          i = 1
          while i < result.length
            puts "(Before yield): i is: #{i}, result is: #{result}, result[0] is: #{result[0]}, acc is: #{acc}"
            acc = yield(acc, result[i])
            i += 1
          end
          return acc
        end
        result = arg[0]
        self.my_each { |el| result = yield(result, el) }
        return result
      end

      if arg.length.zero?
        if self.is_a? Range
          result = self.to_a
          acc = result[0]
          i = 1
          while i < result.length
            puts "(Before yield): i is: #{i}, result is: #{result}, result[0] is: #{result[0]}, acc is: #{acc}"
            acc = yield(acc, result[i])
            i += 1
          end
          return acc
        elsif self.is_a? Array
          result = self[0]
          i = 1
          while i < self.length
            result = yield(result, self[i])
            i += 1
          end
          return result
        end
      end
    end
  end
end

def multiply_els(arg)
  return arg.my_inject { |acc, el| acc * el }
end
