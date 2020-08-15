=begin
Input
Array a is a non-empty list of unique integers that range between 1 to 1,000,000,000
Size N is between 1 and 1,000,000
Output
An array where each index i contains an integer denoting the maximum number of contiguous subarrays of a[i]
Example:
a = [3, 4, 1, 6, 2]
output = [1, 3, 1, 5, 1]
=end

def count_subarrays(arr)
  counts = []
  for i in (0...arr.size) do
    count = 0
    for j in (i...arr.size) do
      if(arr[i] >= arr[j])
        count += 1
      else
        break
      end
    end
    j = i-1
    while(j >= 0)
      if(arr[i] > arr[j])
        count += 1
      else
        break
      end
      j -= 1
    end
    counts << count
  end
  counts
end  

p count_subarrays([3,4,1,6,2])