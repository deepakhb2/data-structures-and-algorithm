# Given a list of numbers and a number k, return whether any two numbers
# from the list add up to k.
#
# For example, given [10, 15, 3, 7] and k of 17, return true since 10 +
# 7 is 17.
#
# Asumptions:
# The given array and k will always contain positive numbers.
#
class Problem1
  def self.solution(values, k)
    return store_seen(values, k)
  end

  # Time complexity: O(N) => Lookup in hash is O(1)
  # Space complexity: O(N)
  def self.store_seen(values, k)
    seen = {}
    values.each do |value|
      if(seen[k - value])
        return true
      end
      seen[value]=true
    end
    return false
  end

  # Time complexity: O(N^2)
  # Space complexity: O(1)
  def self.brute_fource(values, ke)
    size = values.size
    if(size <= 1 || k < 1)
      return false
    elsif(size == 2)
      return (values[0] + values[1]) == k
    end

    (0...size).each do |i|
      (1...size).each do |j|
        if(values[i]+values[j] == k)
          return true
        end
      end
    end
    return false
  end
end
