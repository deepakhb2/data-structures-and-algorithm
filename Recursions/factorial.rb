# Factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120
# Recursive method
def rfactorial(n)
  return 1 if n == 1
  return 2 if n == 2
  return n * rfactorial(n-1)
end

# Non recusive method
def lfactorial(n)
  fact = 1
  (1..n).each do |n|
    fact *= n
  end
  return fact
end

p rfactorial(5)
p lfactorial(5)