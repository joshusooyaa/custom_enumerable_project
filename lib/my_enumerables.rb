module Enumerable
  # Your code goes here

  def my_each_with_index
    arr = Array.new(self)
    (0...length).each { |index| yield(self[index], index) }
    arr
  end

  def my_select
    arr = []
    my_each { |element| arr << element if yield(element) }
    arr
  end

  def my_all?
    my_each { |element| return false unless yield(element) }
    true
  end

  def my_any?
    my_each { |element| return true if yield(element) }
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    (0...length).each do |index|
      yield(self[index])
    end
    self
  end
end
