# frozen_string_literal: true

# Enumerable#my_count	          spec/my_count_spec.rb
# Enumerable#my_map	            spec/my_map_spec.rb
# Enumerable#my_inject	        spec/my_inject_spec.rb

# Collection of iteration methods, inspired by Ruby's Enumerable module
module Enumerable
  # Iterates the given block for each element with an index.
  def my_each_with_index
    index = 0
    my_each do |i|
      yield(i, index)
      index += 1
    end
  end

  # Returns an array containing elements selected by the block.
  # With a block given, calls the block with successive elements.
  def my_select(&block)
    selected_elements = []
    my_each do |i|
      selected_elements << i if block.call(i)
    end
    selected_elements
  end

  # Returns whether every element meets a given criterion.
  def my_all?(&block)
    my_each do |i|
      return false if block.call(i) == false
    end
    true
  end

  # Returns whether any element meets a given criterion.
  def my_any?(&block)
    my_each do |i|
      return true if block.call(i) == true
    end
    false
  end

  # Returns whether no element meets a given criterion.
  def my_none?(&block)
    my_each do |i|
      return false if block.call(i) == true
    end
    true
  end

  # Returns the count of elements, based on an argument or block criterion
  def my_count(&block)
    counter = 0
    my_each do |i|
      if block_given? == false
        counter += 1
      elsif block.call(i) == true
        counter += 1
      end
    end
    p counter
  end

  # Returns an array of objects returned by the block.
  def my_map
    nil
  end

  # Returns an object formed from operands via either:
  # A method named by symbol.
  # A block to which each operand is passed.
  def my_inject
    nil
  end
end

# inspired by Ruby's Array#each
# Methods of the enumerable module above will have access to this method
class Array
  # Calls the given block once for each element in self,
  # passing that element as a parameter. Returns the array itself.
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end
end

enumerable = [1, 1, 2, 3, 5, 8, 13, 21, 34]