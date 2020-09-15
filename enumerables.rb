module Enumerable
  def my_each(&block)
    return to_enum unless block_given?

    i = 0
    if is_a? Range
      iterable_array = self.to_a
    elsif is_a? Array
      iterable_array = self
    elsif is_a? Hash
      iterable_array = self.to_a
      if block.arity == 0
        yield
      elsif block.arity == 1
        i = 0
        while i < iterable_array.length
          yield(iterable_array[i])
          i += 1
        end
        return self
      elsif block.arity >= 2
        i = 0
        while i < iterable_array.length
          yield(iterable_array[i][0], iterable_array[i][1])
          i += 1
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

    (is_a? Range) || (is_a? Hash) ? iterable_array = to_a : iterable_array = self

    i = 0
    while i < iterable_array.length
      yield(iterable_array[i], i)
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
    (is_a? Range) ? iterable_array = to_a : iterable_array = self
    if arg.length == 1
      i = 0
      if arg[0].is_a? Regexp
        while i < iterable_array.length
          return false unless arg[0].match(iterable_array[i])

          i += 1
        end
        return true
      end
      i = 0
      if arg[0].is_a? Class
        while i < iterable_array.length
          return false unless iterable_array[i].is_a? arg[0]

          i += 1
        end
        return true
      else
        while i < iterable_array.length
          return false if iterable_array[i] != arg[0]

          i += 1
        end
      end
      return true
    end
    block = lambda { |obj| obj } unless block_given?
    i = 0
    while i < iterable_array.length
      return false unless block.call(iterable_array[i])

      i += 1
    end
    return true
  end

  def my_any?(*arg, &block)
    (is_a? Range) ? iterable_array = to_a : iterable_array = self

    if arg.length == 1
      i = 0
      if arg[0].is_a? Regexp
        while i < iterable_array.length
          return true if arg[0].match(iterable_array[i])

          i += 1
        end
        return false
      end

      i = 0
      if arg[0].is_a? Class
        while i < iterable_array.length
          return true if iterable_array[i].is_a? arg[0]

          i += 1
        end
      else
        i = 0
        while i < iterable_array.length
          return true if iterable_array[i] == arg[0]

          i += 1
        end
      end
      return false
    end
    block = lambda { |obj| obj } unless block_given?

    i = 0
    while i < iterable_array.length
      return true if block.call(iterable_array[i])

      i += 1
    end
    return false
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

  def my_map(*arg)
    res = []
    if is_a? Range
      to_a.my_each { |elt| res.push(yield(elt)) }
      return res
    end
    return unless is_a? Array

    return to_enum unless block_given?

    if (arg[0].is_a? Proc) && block_given?
      my_each { |elt| res.push(arg[0].call(elt)) }
      return res
    end

    my_each { |elt| res.push(yield(elt)) }
    return res
  end

  def my_inject(*arg, &block)
    return raise LocalJumpError.new "No block given" if (arg.length == 0) && (!block_given?)

    if arg.length > 2
      return raise ArgumentError.new "wrong number of arguments (given #{arg.length}, expected 0..2)"
    end
    return raise NoMethodError.new "undefined method 'inject' for #{self.class}" unless (is_a? Array) || (is_a? Range)

    result = 0
    if !block_given?
      (is_a? Range) ? iterable_array = to_a : iterable_array = self
      if arg.length == 1
        return TypeError.new "#{arg[0]} is not a symbol nor a string" unless (arg[0].is_a? Symbol) || (arg[0].is_a? String) # Check if it's only a symbol

        our_sym = arg[0].to_s[0]
        result = iterable_array[0]
        i = 1
        while i < iterable_array.length
          result = result.send(our_sym, iterable_array[i])
          i += 1
        end
        return result
      end
      if arg.length == 2
        our_sym = arg[1].to_s[0]
        result = arg[0]
        i = 0
        while i < iterable_array.length
          result = result.send(our_sym, iterable_array[i])
          i += 1
        end
        return result
      end
    elsif block_given?
      if (arg.length == 1) && (arg[0].is_a? Regexp)
        return raise NoMethodError.new "undefined method for #{arg.to_s}"
      end

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
        elsif is_a? Hash
          iterable_array = self.to_a
          acc = iterable_array[0]
          i = 1
          if block.arity == 0
            while i < iterable_array.length
              yield(acc, iterable_array[i])
              i += 1
            end
            return acc
          elsif block.arity == 1
            while i < iterable_array.length
              yield(acc, iterable_array[i])
              i += 1
            end
            return acc
          elsif block.arity >= 2
            i = 1
            acc = iterable_array[0]
            while i < iterable_array.length
              acc = yield(acc, iterable_array[i])
              i += 1
            end
          end
          return acc
        end
      end
    end
  end
end
def multiply_els(arg)
  arg.my_inject { |acc, el| acc * el }
end
