arr = [1, 4, 5, 6, 5, 2, 3, 3, 2, 1]

num_count = {}
arr.each do |num|
  if(num_count[num])
    num_count[num] = num_count[num] + 1
  else
    num_count[num] = 1
  end
end

num_count.each do |num, count|
  if(count == 1)
    p num
    break
  end
end