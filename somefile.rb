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
            result = arg[0]
            i=1
            while i<self.length
                result=result.send(our_sym,self[i])
                i+=1
            end
            return result
        end
    elsif
    end
end

  # Thow an error unless we were given an array of integers
  return "Error" unless self.kind_of? Array
  
  # Initialize a result variable to zero
  result=0
  if !block_given? 
  # Check if we were given one argument without a block
    if arg.length == 1
      # Check if it's not a symbol return
      return "Arg[0] is not a Symbol..." unless arg[0].kind_of? Symbol # Check if it's only a symbol 
      
      # Iterate the array of elements and apply (symbol)= to the result
      our_sym=arg[0].to_s[0]
      #result = 1 if our_sym == '*'
      result = self[0]
      #self.my_each {|el| result=result.send(our_sym,el)}
      i=1
      while i<self.length
        result=result.send(our_sym,self[i])
        i+=1
      end
      return result
      # Return result variable
    # end only symbol check
    end
  # Check if we were given two arguments without a block
    # Throw an error unless the first argument is an integer and the second is a symbol
    if arg.length == 2

    # Check if the first argument is an integer and the second is a symbol
      # Set the result variable equal to the first argument
      result = arg[0]
      # Iterate over the array and add its elements to the result variable
      i=1
      while i<self.length
        result=result.send(our_sym,self[i])
        i+=1
      end
      # return the result variable
      return result
    #
    end

    elsif block_given?  # Check if we were given a block
  
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
  end