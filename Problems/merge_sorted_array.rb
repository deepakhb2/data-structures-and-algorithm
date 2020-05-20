ar1 = [1, 5, 9, 10, 15, 20]
ar2 = [2, 3, 8, 13]
p ar1, ar2
m = ar1.size
n = ar2.size
p m, n
p "Started"

def merge(ar1, ar2, m, n)
  (ar2.size-1).downto(0).each do |i|
    last = ar1[m-1]
    j = m-2
    p last, i, j
    while(j >= 0 && ar1[j] > ar2[i])
      ar1[j+1] = ar1[j]
      j -= 1
      p ar1, ar2
    end
    p i, j
    if(j != m-2 || last > ar2[i])
      ar1[j+1] = ar2[i] 
      ar2[i] = last 
    end
    p ar1, ar2
  end
end

merge(ar1, ar2, m, n)
p ar1
p ar2