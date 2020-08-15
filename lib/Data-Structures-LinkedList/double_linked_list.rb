class Node
  attr_accessor :next, :previous
  attr_reader :value

  def initialize(value)
    @value = value
    @next, @previous = nil, nil
  end
end

class DoubleLinkedList
  attr_reader :length

  def initialize
    @head, @tail = nil, nil
    @length = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @tail == nil
      @head = @tail = new_node
      @length += 1
    else
      @tail.next = new_node
      new_node.previous = @tail
      @tail = new_node
      @length += 1
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head == nil
      @head = @tail = new_node
      @length += 1
    else
      @head.previous = new_node
      new_node.next = @head
      @head = new_node
      @length += 1
    end
  end

  def insert(index, value)
    if(index <= 0)
      append(value)
    elsif(index >= @length)
      prepend(value)
    else
      new_node = Node.new(value)
      temp_node = @head
      i = 0 
      while(i < index)
        if(i+1 == index)
          new_node.previous = temp_node
          new_node.next = temp_node.next
          temp_node.next = new_node
          new_node.next.previous = new_node
          @length += 1
        end
        i += 1
        temp_node = temp_node.next
      end
    end
  end

  def remove(index)
    if(index <= 0)
      remove_node = @head
      @head = remove_node.next
      @head.previous = nil
      @length -= 1
    elsif(index >= @length)
      remove_node = @tail
      @tail = remove_node.previous
      @tail.next = nil
      @length -= 1
    else
      temp_node = @head
      i = 0
      while(i <= index)
        if(i == index)
          temp_node.previous.next = temp_node.next
          temp_node.next.previous = temp_node.previous
          temp_node.next = temp_node.previous = nil
          @length -= 1
        end
        i += 1
        temp_node = temp_node.next
      end
    end
  end

  def values
    values = []
    temp_node = @head
    while(temp_node != nil)
      values.append(temp_node.value)
      temp_node = temp_node.next
    end
    values
  end
end

dbllinked_list = DoubleLinkedList.new
dbllinked_list.append(1)
p dbllinked_list.values
dbllinked_list.append(2)
p dbllinked_list.values
dbllinked_list.append(4)
p dbllinked_list.values
dbllinked_list.insert(2, 3)
p dbllinked_list.values
dbllinked_list.prepend(0)
p dbllinked_list.values
dbllinked_list.remove(2)
p dbllinked_list.values