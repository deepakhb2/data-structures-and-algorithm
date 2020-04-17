# Formula: x[n-2] + x[n-1] = x[n]
# 4 
# (f(4))
# (f(2)+f(3))
# ((f(0)+f(1)) + (f(1) + f(2))
# ((0 + 1) + (1 + (0 + 1))) = 3    eg. 0 1 1 2 3 

def rfibonacci(n)
  if(n < 2)
    return n
  end
  return rfibonacci(n-1) + rfibonacci(n-2)
end

def lfibonacci(num)
  n2 = 0
  n1 = 1
  sum = 0
  (2..num).each do |i|
    sum = n2 + n1
    n2 = n1
    n1 = sum
  end
  return sum
end

p lfibonacci(6)
p rfibonacci(6)

#5
#0 1 1 2 3 5
#
#fib(5) = fib(4) + fib(3) = 3 + 2 = 5
#fib(4) = fib(3) + fib(2) = 2 + 1 = 3
#fib(3) = fib(2) + fib(1) = 1 + 1 = 2
#fib(2) = fib(1) + fib(0) = 1 + 0 = 1
#fib(1) = 1
#fib(0) = 0