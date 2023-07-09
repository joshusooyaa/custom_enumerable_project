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

  def my_none?
    my_each { |element| return false if yield(element) }
    true
  end

  def my_count(&block)
    return length unless block_given?

    my_select(&block).length
  end

  def my_map
    arr = []
    my_each { |element| arr << yield(element) }
    arr
  end

  def my_inject(result)
    my_each { |element| result = yield(result, element) }
    result
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
