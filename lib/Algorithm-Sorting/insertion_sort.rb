class InsertionSort
  class << self
    # Sort using recursion
    def recursive(values, i=0)
      return values if i >= values.size

      (0...i).each do |j|
        values[j], values[i] = values[i], values[j] if (values[i] < values[j])
      end
      return recursive(values, i+1)
    end

    # Sort using loop
    def non_recursive(values)
      n = values.size
      (0...n).each do |i|
        (0...i).each do |j|
          if(values[i] < values[j])
            values[j], values[i] = values[i], values[j]
          end
        end
      end
      return values
    end
  end
end
