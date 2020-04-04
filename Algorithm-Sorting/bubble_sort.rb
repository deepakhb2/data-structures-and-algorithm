# Best case: Omega(n)
# Worst case: O(n^2)

values = [5,2,4,7,1,3,6]

def swap(values, i, j)
  total = values[i] + values[j]
  values[i] = total - values[i]
  values[j] = total - values[i]
  return true
end

# Solve bubble sort using recursive approach
def r_bubble_sort(values, count, swap)
  len = values.size
  if(!swap && len > 0 && count <= len)
    i = 0
    while(i < len-1)
      j = i+1
      if(values[i] > values[j])
        swap = swap(values, i, j)
      end
      i += 1
    end
    return values if !swap
    count += 1 
  else
    return values
  end
  p count 
  return r_bubble_sort(values, count, false) 
end

p r_bubble_sort(values, 1, false)

values = [5,2,4,7,1,3,6]
# Solve buble sort using loop
def l_bubble_sort(values)
  len = values.size
  if(len > 0)
    (0..len-2).each do
      swap = false
      i = 0 
      (1..len-1).each do
        j = i+1
        if(values[i] > values[j])
          swap = swap(values, i, j)
        end
        i += 1
      end
      return values unless swap
    end
  end
  return values
end

p l_bubble_sort(values)