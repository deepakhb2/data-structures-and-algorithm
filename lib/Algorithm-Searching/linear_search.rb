values = [5,2,4,7,1,3,6]

# O(n)
def linear_search(values, number)
  values.each do |value|
    return value if number == value
  end
  return nil
end

p linear_search(values, 3)
p linear_search(values, 10)