# Best case: Omega(nlog(n))
# Worst case: O(nlog(n))

values = [5,2,4,8,7,1,3,6]

def swap(arr, first_index, second_index)
  temp = arr[first_index]
  arr[first_index] = arr[second_index]
  arr[second_index] = temp
end

def l_pivot_partition(arr, left, right)
  pivot = left
  pivot_elem = arr[pivot]
  partition_index = left+1 

  (left..right).each do |i|
    if(arr[i] < pivot_elem)
      swap(arr, i, partition_index)
      partition_index += 1
    end
  end
  swap(arr, left, partition_index-1)
  partition_index-1
end

def r_pivot_partition(arr, pivot, left, right)
  pivot = right
  pivot_elem = arr[pivot]
  partition_index = left

  (left..right).each do |i|
    if(arr[i] < pivot_elem)
      swap(arr, i, partition_index)
      partition_index += 1
    end
  end
  swap(arr, right, partition_index)
  partition_index
end

def quick_sort(arr, left, right, left_pivot = true)
  len = arr.size
  if(left < right)
    partition_index = l_pivot_partition(arr, left, right) if left_pivot
    partition_index = l_pivot_partition(arr, left, right) unless left_pivot
    quick_sort(arr, left, partition_index-1, left_pivot)
    quick_sort(arr, partition_index+1, right, left_pivot)
  end
  return arr
end

p values
p "Sort using first element as pivot: "
p quick_sort(values, 0, values.size-1, true)
p "Sort using last element as pivot: "
p quick_sort(values, 0, values.size-1, false)
