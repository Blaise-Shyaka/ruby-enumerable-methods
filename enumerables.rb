module Enumerable
  def my_each(&block)

    return to_enum unless block_given?
    
    i = 0
    if is_a? Range
      iterable_array = self.to_a
    elsif is_a? Array
      iterable_array = self
    elsif is_a? Hash
      iterable_array=self.to_a
      if block.arity == 0
        yield
      elsif block.arity == 1
        i=0
        while i<iterable_array.length
          yield(iterable_array[i])
          i+=1
        end
        return self
      elsif block.arity >=2
        i = 0
        while i < iterable_array.length
          yield(iterable_array[i][0], iterable_array[i][1])
          i+=1
        end       
      end
      self
    end
    
    while i <= iterable_array.length - 1
      yield(iterable_array[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum unless block_given?

    object_to_return = []
    if is_a? Range
      to_a.my_each { |elt| object_to_return.push(elt) if yield(elt) }
      return object_to_return
    end
    my_each do |element|
      object_to_return << element if yield(element)
    end
    object_to_return
  end

  def my_all?(*arg, &block)
    if arg.length == 1
      i = 0
      if arg[0].is_a? Class
        while i < length
          return false unless self[i].is_a? arg[0]

          i += 1
        end
        return true
      else
        while i < length
          return false if self[i] != arg

          i += 1
        end
      end
      return true
    end
    block = lambda { |obj| obj } unless block_given?

    i = 0
    while i < length
      return false unless block.call(self[i])

      i += 1
    end
    true
  end

  def my_any?(*arg, &block)
    if arg.length == 1
      i = 0
      if arg[0].is_a? Class
        while i < length
          return true if self[i].is_a? arg[0]
          i += 1
        end
      else
        i = 0
        while i < length
          return true if self[i] == arg

          i += 1
        end
      end
      return false
    end
    block = lambda { |obj| obj } unless block_given?

    i = 0
    while i < length
      return true if block.call(self[i])

      i += 1
    end
    false
  end

  def my_none?(*arg, &block)
    !my_any?(*arg, &block)
  end

  def my_count(*arg, &block)
    count = 0
    if is_a? Range
      iterable_array = to_a
    else
      iterable_array = self
    end
    if arg.length == 1
      i = 0
      while i < iterable_array.length
        count += 1 if iterable_array[i] == arg[0]
        i += 1
      end
      return count
    end
    block = lambda { |obj| obj } unless block_given?

    i = 0
    while i < iterable_array.length
      count += 1 if block.call(iterable_array[i])
      i += 1
    end
    count
  end

  def my_map
    res = []
    if is_a? Range
      to_a.my_each { |elt| res.push(yield(elt)) }
      res
    end
    return unless is_a? Array

    return to_enum unless block_given?

    my_each { |elt| res.push(yield(elt)) }
    res
  end

  def my_inject(*arg)
    return raise LocalJumpError.new "No block given" if (arg.length == 0) && (!block_given?) 

    if arg.length > 2
      return ArgumentError.new "wrong number of arguments (given #{arg.length}, expected 0..2)"
    end

    return 'Error' unless (is_a? Array) || (is_a? Range)

    result = 0
    if !block_given?

      return if is_a? Range

      if arg.length == 1
        return unless arg[0].is_a? Symbol # Check if it's only a symbol

        our_sym = arg[0].to_s[0]
        result = self[0]
        i = 1
        while i < length
          result = result.send(our_sym, self[i])
          i += 1
        end
        return result
      end
      if arg.length == 2
        our_sym = arg[1].to_s[0]
        result = arg[0]
        i = 0
        while i < length
          result = result.send(our_sym, self[i])
          i += 1
        end
        return result
      end
    elsif block_given?
      if (arg.length == 1) && (arg[0].is_a? Integer)
        if is_a? Range
          result = to_a
          acc = result[0]
          i = 1
          while i < result.length
            acc = yield(acc, result[i])
            i += 1
          end
          acc
        end
        result = arg[0]
        my_each { |el| result = yield(result, el) }
        return result
      end

      if arg.length.zero?
        if is_a? Range
          result = to_a
          acc = result[0]
          i = 1
          while i < result.length
            acc = yield(acc, result[i])
            i += 1
          end
          return acc
        elsif is_a? Array
          result = self[0]
          i = 1
          while i < length
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
  arg.my_inject { |acc, el| acc * el }
end
