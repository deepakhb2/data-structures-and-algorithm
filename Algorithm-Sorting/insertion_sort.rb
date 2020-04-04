values = [5,2,4,7,1,3,6]
print "Input: "
p values

# Sort using loop
def l_selection_sort(values)
  n = values.size
  (0...n).each do |i|
    (0...i).each do |j|
      if(values[i] < values[j])
        values[j], values[i] = values[i], values[j]
      end
    end
  end
  return values
end

print "Result: "
p l_selection_sort(values)

values = [5,2,4,7,1,3,6]

# Sort using recursion
def r_selection_sort(values, i=0)
  if(i >= values.size)
    return values
  end

  (0...i).each do |j|
    if(values[i] < values[j])
      values[j], values[i] = values[i], values[j]
    end
  end
  return r_selection_sort(values, i+1)
end

print "Result: "
p r_selection_sort(values)
  