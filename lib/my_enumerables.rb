module Enumerable
  # Your code goes here
  def my_each_with_index
    arr = Array.new(self)
    (0...length).each do |index|
      yield(self[index], index)
    end
    arr
  end

  def my_select
    arr = []
    my_each do |element|
      arr << element if yield(element)
    end
    arr
  end

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    array = Array.new(self)
    (0...length).each do |index|
      yield(self[index])
    end
    array
  end
end
