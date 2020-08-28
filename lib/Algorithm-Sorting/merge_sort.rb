# Best case: Omega(nlog(n))
# Worst case: O(nlog(n))

class MergeSort
  class << self
    def merge(left, right)
      result = []
      i, j = 0, 0
      while(i < left.size && j < right.size)
        if(left[i] < right[j])
          result.push(left[i])
          i += 1
        else
          result.push(right[j])
          j += 1
        end
      end
      return result + left[i..-1] + right[j..-1]
    end

    def recursive(arr)
      return arr if(arr.size == 1)

      len = arr.size
      mid = len/2
      start = 0

      return merge(
        recursive(arr[start...mid]),
        recursive(arr[mid...len])
      )
    end
  end
end
