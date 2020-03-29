class MyArray
  def initialize
    @length = 0
    @data = {}
  end

  def length
    @length
  end

  def to_s
    puts @data
  end

  def push(item)
    @data[@length] = item
    @length += 1
  end

  def pop
    last_item = @data[@length-1]
    @data.delete(@length-1)
    @length -= 1
    last_item
  end

  def delete(index)
    del_item = @data[index]
    (index...@length).each do |i|
      @data[i] = @data[i+1]
    end
    @data.delete(@length-1)
    @length -= 1
    del_item
  end
end

array = MyArray.new
array.push(3)
array.pop
array.push('hi')
array.push(34)
array.push(20)
array.push('hey')
array.push('welcome')
array.delete(3)
array.pop
array.pop
puts(array)
