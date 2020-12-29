# Given an array of numbers of length N, find both the minimum and maximum using less than 2 * (N - 2) comparisons.

class Problem235

  # Non Recursive
  def self.non_recursive_solution(values, comparisons)
    if(values.size == 1)
      return values[0], values[0], comparisons
    end
    if(values.size == 2)
      return (values[0] < values[1]) ? [values[0], values[1], comparisons+1] : [values[1], values[0], comparisons+1]
    end
    min = max = values[0]
    compare = lambda { |x,y| x < y ? [x, y] : [y, x] }
    values.each_slice(2) do |arr|
      comparisons += 1
      smaller, bigger = compare.call(arr[0], arr[1])
      comparisons += 1
      min = min(min, smaller)
      comparisons += 1
      max = max(max, bigger)
    end
    return min, max, comparisons
  end
  # Recursive
  def self.recursive_solution(values, comparisons)
    if(values.size == 1)
      return values[0], values[0], comparisons
    elsif(values.size == 2)
      return (values[0] < values[1]) ? [values[0], values[1], comparisons+1] : [values[1], values[0], comparisons+1]
    else
      n = values.size / 2
      lmin, lmax, comparisons = recursive_solution(values[0...n], comparisons+1)
      rmin, rmax, comparisons = recursive_solution(values[n...values.size], comparisons+1)
      return min(lmin, rmin), max(lmax, rmax), comparisons
    end
  end

  def self.min(x, y)
    x < y ? x : y
  end

  def self.max(x, y)
    x > y ? x : y
  end

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
