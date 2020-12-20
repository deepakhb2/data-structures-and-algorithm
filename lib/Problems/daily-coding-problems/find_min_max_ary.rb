# Given an array of numbers of length N, find both the minimum and maximum using less than 2 * (N - 2) comparisons.

class Problems
  def self.find_min_max_in_ary(values)
    min, max = 0, 0
    comparisons = 0
    comparisons += 1
    if(values.size == 1)
      min = values[0]
      max = values[0]
      return min, max
    end
    comparisons += 1
    if(values[0] <= values[1])
      min = values[0]
      max = values[1]
    else
      min = values[1]
      max = values[0]
    end
    values.shift
    values.shift
    values.each do |value|
      comparisons += 1
      if(value < min)
        min = value
      end
      comparisons += 1
      if(value > max)
        max = value
      end
    end
    [min, max, comparisons]
  end
end
