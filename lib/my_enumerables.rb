module Enumerable
  def my_each_with_index
    index = 0
    my_each do |element|
      yield [element, index]
      index += 1
    end
  end

  def my_select
    arr = []
    my_each do |element|
      arr << element if yield(element) == true
    end
    arr
  end

  def my_all?
    my_each do |element|
      return false if yield(element) == false
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element) == true
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element) == true
    end
    true
  end

  def my_count
    if block_given? == true
      count = 0
      my_each do |element|
        count += 1 if yield(element) == true
      end
      count
    else
      length
    end
  end

  def my_map
    arr = []
    my_each do |element|
      arr << yield(element)
    end
    arr
  end

  def my_inject(initial_value)
    value = initial_value
    my_each do |element|
      value = yield(value, element)
    end
    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    index = 0
    until index == length
      p yield (self[index])
      index += 1
    end
    p self
  end
end
