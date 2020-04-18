=begin
Signature
int[] find_max_product(int[] arr)
Input
n is in the range [1, 100,000].
Each value arr[i] is in the range [1, 1,000].
Output
Return a list of n integers output[0..(n-1)], as described above.
Example 1
n = 5
arr = [1, 2, 3, 4, 5]
output = [-1, -1, 6, 24, 60]
The 3rd element of output is 3*2*1 = 6, the 4th is 4*3*2 = 24, and the 5th is 5*4*3 = 60.
Example 2
n = 5
arr = [2, 1, 2, 1, 2]
output = [-1, -1, 4, 4, 8]
The 3rd element of output is 2*2*1 = 4, the 4th is 2*2*1 = 4, and the 5th is 2*2*2 = 8.
=end


class Heap
  attr_accessor :values
  def initialize
    @values = []
  end

  def push(value)
    @values.push(value)
  end

  def pop(values)
    @values.pop
  end

  def size
    @values.size
  end

  def sum
    @values.inject(1){|s, i| s*i}
  end

  def bubble_up
    i = @values.size-1
    while(i >= 1)
      p = (i-1)/2
      if @values[p] > @values[i]
        @values[p], @values[i] = @values[i], @values[p]
      end
      i = p
    end
  end
  
  def heapify(i)
    min = i
    l = (2*i)+1
    r = (2*i)+2
    
    if(l < @values.size && @values[l] < @values[min]) 
      min = l
    end
  
    if(r < @values.size && @values[r] < @values[min]) 
      min = r
    end
    
    if(min != i)
      @values[i], @values[min] = @values[min], @values[i]
      self.heapify(min); 
    end   
  end
  
  def remove_min
    @values[0] = @values[@values.size-1]
    @values.pop
    self.heapify(0)
  end
end

def find_max_product(arr)
  min_heap = Heap.new
  output = []
  arr.each do |v|
    if(min_heap.size < 2)
      min_heap.push(v)
      min_heap.bubble_up
      output.push(-1)
    else
      min_heap.push(v)
      min_heap.bubble_up
      min_heap.remove_min if min_heap.size > 3
      output.push(min_heap.sum)
    end
  end
  return output
end  

# Call find_max_product() with test cases here 
p find_max_product([1,2,3,4,5])