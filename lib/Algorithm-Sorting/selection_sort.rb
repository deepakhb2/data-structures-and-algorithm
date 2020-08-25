# Time complexity:
# Omega(n^2)
# Teta(n^2)
#
class SelectionSort
  class << self
    def recursive(values, i=0)
      len = values.size
      return values if i>=len

      j = i+1
      min_index = i
      while(j < len)
        if(values[j] < values[min_index])
          min_index = j
        end
        j += 1
      end
      values[i], values[min_index] = values[min_index], values[i]
      return recursive(values, i+1)
    end

    def non_recursive(values)
      len = values.size
      (0...len-1).each do |i|
        min_index = i
        (i...len).each do |j|
          if(values[j] < values[min_index])
            min_index = j
          end
        end
        values[i], values[min_index] = values[min_index], values[i]
      end
      return values
    end
  end
end
