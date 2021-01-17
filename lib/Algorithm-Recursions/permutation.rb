=begin
Write a program to print all permutations of a given string
A permutation, also called an “arrangement number” or “order,” is a
rearrangement of the elements of an ordered list S into a one-to-one
correspondence with S itself. A string of length n has n! permutation.

Source: Mathword(http://mathworld.wolfram.com/Permutation.html)

Below are the permutations of string ABC.
ABC ACB BAC BCA CBA CAB
=end

# Time complexity: O(2^n)
def permutation(arr, l, r)
  if(l == r)
    p arr.join.to_s
  else
    for i in (l..r)
      arr[i], arr[l] = arr[l], arr[i]
      permutation(arr, l+1, r)
      arr[i], arr[l] = arr[l], arr[i]
    end
  end
end

a = ['a', 'b', 'c']
permutation(a, 0, a.size-1)


# (a, 0, 2)
#   i = 0 => (a, 1, 2)
#   i = 1 => (a, 1, 2)
#   i = 2 => (a, 1, 2)
# (a, 1, 2)
#   i = 1 => (a, 2, 2)
#   i = 2 => (a, 2, 2)
# (a, 1, 2)
#   i = 1 => (a, 2, 2)
#   i = 2 => (a, 2, 2)
# (a, 1, 2)
#   i = 1 => (a, 2, 2)
#   i = 2 => (a, 2, 2)
