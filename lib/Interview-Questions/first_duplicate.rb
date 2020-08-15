=begin
ref: https://www.youtube.com/watch?v=XSdr_O-XVRQ
Values 1 to n where n is length of array - 1
Valid Arrays:
[1,2,3,4]    => -1
[1,2,1,3,5]  => 1
[2,1,3,5,3,2]=> 3
=end

values = [2,1,3,1,5,3,2]

def find_duplicate_n2_1(values)
  min_index = values.size 
  (0...values.size).each do |i|
    (i+1...values.size).each do |j|
      if(values[i]==values[j] && min_index > j)
        min_index = j
      end
    end
  end
  return -1 if min_index == values.size 
  return values[min_index]
end

p 'Find duplicate using O(n^2) time complexity: '
p find_duplicate_n2_1(values)

# Time and space complexity is O(n)
def find_duplicate_n_n(values)
  hash_values = {}
  (0...values.size).each do |i|
    unless(hash_values[values[i]])
      hash_values[values[i]] = i
    else
      return values[i]
    end
  end
  return -1 
end

p 'Find duplicate using O(n) time and space complexity: '
p find_duplicate_n_n(values)

# Time complexity is O(n)
# Space complexity is O(1)
def find_duplicate_n_1(values)
  for i in (0...values.size) do
    neg_value = values[values[i]-1].abs * -1
    if(values[values[i]-1] == neg_value)
      return neg_value.abs
    else
      values[values[i]-1] = neg_value
    end
  end
  p "D" 
  return -1 
end

p 'Find duplicate using O(n) time complexity and o(1) space complexity: '
p find_duplicate_n_1(values)