# Best case: Omega(nlog(n))
# Worst case: O(nlog(n))

values = [5,2,4,8,7,1,3,6]

def swap(arr, first_index, second_index)
  temp = arr[first_index]
  arr[first_index] = arr[second_index]
  arr[second_index] = temp
end

def partition(arr, pivot, left, right)
  pivot_elem = arr[pivot]
  partition_index = left

  (left...right).each do |i|
    if(arr[i] < pivot_elem)
      swap(arr, i, partition_index)
      partition_index += 1
    end
  end
  swap(arr, right, partition_index)
  partition_index
end

def quick_sort(arr, left, right)
  len = arr.size
  if(left < right)
    pivot = right
    partition_index = partition(arr, pivot, left, right)
    quick_sort(arr, left, partition_index-1)
    quick_sort(arr, partition_index+1, right)
  end
  return arr
end

p values
p quick_sort(values, 0, values.size-1)
