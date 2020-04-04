values = [5,2,4,7,1,3,6]
print "Input: "
p values

# Solve bubble sort using loop
def l_selection_sort(values)
  len = values.size
  (0...len-1).each do |i|
    min_index = i
    (i...len).each do |j|
      if(values[j] < values[min_index])
        min_index = j
      end
    end
    values[i], values[min_index] = values[min_index], values[i]
  end
  return values
end

print "Result: "
p l_selection_sort(values)

values = [5,2,4,7,1,3,6]
def r_selection_sort(values, i)
  len = values.size
  if(i >= len)
    return values
  end
  j = i+1
  min_index = i
  while(j < len)
    if(values[j] < values[min_index])
      min_index = j
    end
    j += 1
  end
  values[i], values[min_index] = values[min_index], values[i]
  return r_selection_sort(values, i+1)
end

print "Result: "
p r_selection_sort(values, 0)
