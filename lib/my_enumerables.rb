# frozen_string_literal: true

# The following table has the methods you will need to implement along with
# their associated specs, as outlined in the project instructions. The methods
# in the Enumerable module only need to work with Arrays, but you can
# challenge yourself and try to make them work for Hashes as well.

# Method	                      Spec File	Notes
# Enumerable#my_select	        spec/my_select_spec.rb
# Enumerable#my_all?	          spec/my_all_spec.rb
# Enumerable#my_any?	          spec/my_any_spec.rb
# Enumerable#my_none?	          spec/my_none_spec.rb
# Enumerable#my_count	          spec/my_count_spec.rb
# Enumerable#my_map	            spec/my_map_spec.rb
# Enumerable#my_inject	        spec/my_inject_spec.rb

# Testing
# bundle exec rspec spec/my_each_spec.rb
# ...

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
    selected_elments = []
    my_each do |i|
      selected_elments << i if block.call(i)
    end
    selected_elments
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

# yield vs &block
# def transaction_statement
#  @transactions.each do |transaction|
#    yield transaction # You just yield the transaction amount.
#   end
# end
# ===
#  def my_each(&block)
#   @test_arr.each(&block)
#  end
