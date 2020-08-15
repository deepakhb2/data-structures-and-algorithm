values = [1,2,3,4,5,6,7,8,9,10]
p values

# Solution using recursive
# O(log(n)
def r_binary_search(values, num)
  s = 0
  e = values.size
  m = e/2
  return nil unless values[m]
  if(values[m] == num)
    return num
  elsif(num < values[m])
    r_binary_search(values[s...m], num)
  elsif(num > values[m])
    r_binary_search(values[m+1...e].to_a, num)
  end
end

print "Search 9: "
p r_binary_search(values, 9)
print "Search -1: "
p r_binary_search(values, -1)

# Solution using while looop
# O(log(n))
def l_binary_search(values, num)
  while(values.size > 0)
     s = 0 
     e = values.size
     m = e/2
    if(values[m] == num)
      return num
    elsif(num > values[m])
      values = values[m+1...e]
    elsif(num < values[m])
      values = values[s...m]
    end
  end
end

print "Search 3: "
p l_binary_search(values, 3)
print "Search -1: "
p l_binary_search(values, -1)
