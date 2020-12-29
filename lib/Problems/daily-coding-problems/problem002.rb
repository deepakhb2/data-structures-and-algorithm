# This problem was asked by Uber.
#
# Given an array of integers, return a new array such that each element at
# index i of the new array is the product of all the numbers in the original
# array except the one at i.
#
# For example, if our input was [1, 2, 3, 4, 5], the expected output would be
# [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would
# be [2, 3, 6].
#
# Follow-up: what if you can't use division?
class Problem002
  # O(n) space and time complexity
  def self.solution(values)
    result, size = [], values.size
    prefix_products = []
    (0...size).each do |i|
      if prefix_products.empty?
        prefix_products.append(values[i])
      else
        prefix_products.append(prefix_products[-1] * values[i])
      end
    end
    suffix_products = []
    values.reverse.each do |val|
      if suffix_products.empty?
        suffix_products << val
      else
        suffix_products << suffix_products[-1] * val
      end
    end
    suffix_products = suffix_products.reverse
    (0...size).each do |i|
      if(i==0)
        result.append(suffix_products[i + 1])
      elsif(i == size-1)
        result.append(prefix_products[i - 1])
      else
        result.append(prefix_products[i-1] * suffix_products[i+1])
      end
    end
    return result
  end

  # O(n^2) time complexity
  def self.solution1(values)
    result, size = [], values.size
    (0...size).each do |i|
      mult = 1
      (0...size).each do |j|
        unless(i == j)
          mult *= values[j]
        end
      end
      result << mult
    end
    return result
  end
end
