=begin
ref: https://www.youtube.com/watch?v=4eWKHLSRHPY
You have a sorted array of integers.
Write a function that returns a sorted array containing the squares of those integers.
Input array length: 1 <= N <= 1000
Input array elements: -1000 <= N <= 1000

Input array will be sorted.
Output array should be sorted.
=end

require_relative '../Algorithm-Sorting/merge_sort'

values = [-7, -3, -1, 4, 8, 12]
print 'Input: '
p values

# Time Complexity: O(nlog(n))
# Space Complexity: O(n)
def sorted_squared_array_n_nlogn(values)
  values.collect!{|val| val*val}
  merge_sort(values)
end

p 'Square the array by looping through array and sort using merge sort: '
p sorted_squared_array_n_nlogn(values)

values = [-7, -3, -1, 4, 8, 12]
# Time Complexity: O(n)
# Space Complexity: O(n)
# [-7, -3, -1, 4, 8, 12]
# 1st loop: first_i = 2 last_i = 1 len = -1 
# output = [1, 9, 16, 49, 64, 144] 
def sorted_squared_array_n_n(values)
  len = values.size - 1 
  first_i = 0
  last_i = len
  output = Array.new(len+1) 
  while(len > -1)
    if(values[first_i].abs > values[last_i].abs)
      output[len] = values[first_i] * values[first_i]
      first_i += 1
    else
      output[len] = values[last_i] * values[last_i]
      last_i -= 1
    end
    len -= 1
  end
  output
end

p 'Sort and square the array using one loop'
p sorted_squared_array_n_n(values)
