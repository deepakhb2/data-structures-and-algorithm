# Best case: Omega(nlog(n))
# Worst case: O(nlog(n))

values = [5,2,4,7,1,3,6]

def merge(left, right)
  result = []
  i, j = 0, 0 
  while(i < left.size && j < right.size)
    if(left[i] < right[j])
      result.push(left[i])
      i += 1
    else
      result.push(right[j])
      j += 1
    end
  end
  return result + left[i..-1] + right[j..-1]
end

def merge_sort(arr)
  if(arr.size == 1)
    return arr
  end
  len = arr.size
  mid = len/2
  start = 0

  return merge(
    merge_sort(arr[start...mid]),
    merge_sort(arr[mid...len])
  )
end

p values
p merge_sort(values)