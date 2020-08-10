class MyArray

  private

  attr_reader :data

  def initialize
    @length = 0
    @data = {}
  end

  public

  attr_accessor :length

  def [](index)
    data[index]
  end

  def to_s
    data.values
  end

  def push(item)
    data[length] = item
    self.length += 1
  end

  def pop
    last_item = data[length-1]
    data.delete(length-1)
    last_item
  end

  def delete(index)
    del_item = data[index]
    (index...length).each do |i|
      data[i] = data[i+1]
    end
    data.delete(length-1)
    self.length -= 1
    del_item
  end

  def reverse
    len = length
    dup = self.class.new
    while(len > 0)
      dup.push(data[len-1])
      len-=1
    end
    return dup
  end
end
