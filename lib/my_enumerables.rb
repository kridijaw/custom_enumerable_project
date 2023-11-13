# frozen_string_literal: true

# The following table has the methods you will need to implement along with
# their associated specs, as outlined in the project instructions. The methods
# in the Enumerable module only need to work with Arrays, but you can
# challenge yourself and try to make them work for Hashes as well.

# Method	                      Spec File	Notes
# Enumerable#my_each_with_index	spec/my_each_with_index_spec.rb
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

# define all methods, but #my_each here
module Enumerable
end

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
