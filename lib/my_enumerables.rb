module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      last_array_index = self.length - 1
      i = 0
      until i > last_array_index
        yield self[i], i
        i += 1
      end
      return self
    end
  end

  def my_select
    if block_given?
      selected_arr = []
      self.my_each do |element|
        selected_arr << element if yield element
      end
    return selected_arr
    end
  end

  def my_all?
    if block_given?
      self.my_each do |element|
        return false if yield(element) == false
      end
      return true
    end
  end

  def my_any?
    if block_given?
      self.my_each do |element|
        return true if yield(element) == true
      end
      return false
    end
  end

  def my_none?
    if block_given?
      self.my_each do |element|
        return false if yield(element) == true
      end
      return true
    end
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |element|
        count += 1 if yield(element) == true
      end
      return count
    end
    return self.length
  end

  def my_map
    if block_given?
      mapped_array = []
      self.my_each do |element|
        mapped_array << yield(element)
      end
      return mapped_array
    end
  end

  def my_inject(initial_val)
    if block_given?
      sum = initial_val
      self.my_each do |element|
        sum = yield(sum, element)
      end
      return sum
    end
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      last_array_index = self.length - 1
      i = 0
      until i > last_array_index
        yield self[i]
        i += 1
      end
      return self
    end
  end
end
