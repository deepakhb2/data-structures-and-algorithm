arr = [1, 4, 5, 8, 6, 2, 3, 3, 2, 1]

first = 0
second = 0
arr.each do |num|
  if(num > first)
    second = first
    first = num
  elsif(num < first && num > second)
    second = num
  end
end
p second
