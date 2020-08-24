# Best case: Omega(n)
# Worst case: O(n^2)

class BubbleSort
  class << self
    # Solve bubble sort using recursive approach
    # values: Array with integer elements
    # count: Counter to terminate recursion starts from 1
    # swap: Optimise algoritm to check if array is already sorted.
    #
    def recursive(values, count=1, swap=false)
      len = values.size
      if(!swap && len > 0 && count <= len)
        i = 0
        while(i < len-1)
          j = i+1
          if(values[i] > values[j])
            swap = swap(values, i, j)
          end
          i += 1
        end
        return values if !swap
        count += 1
      else
        return values
      end
      return recursive(values, count, false)
    end

    # Solve buble sort using loop/iterators
    # values: Array of integer values.
    def non_recursive(values)
      len = values.size
      if(len > 0)
        (0...len-1).each do
          swap = false
          i = 0
          (1...len).each do
            j = i+1
            if(values[i] > values[j])
              swap = swap(values, i, j)
            end
            i += 1
          end
          return values unless swap
        end
      end
      return values
    end

    private

    def swap(values, i, j)
      total = values[i] + values[j]
      values[i] = total - values[i]
      values[j] = total - values[i]
      return true
    end
  end
end
