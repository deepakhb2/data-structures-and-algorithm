class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  attr_reader :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def append(value)
    node = Node.new(value)
    unless @head
      @head = node
      @tail = @head
      @length += 1
    else
      @tail.next = node
      @tail = node
      @length += 1
    end
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
    @length += 1
  end

  def insert(index, value)
    if index >= @length
      append(value)
      return
    end
    if index == 0
      prepend(value)
      return
    end
    i = 1
    node = Node.new(value)
    temp = @head
    while(i<@length)
      if(i==index)
        node.next = temp.next
        temp.next = node
        @length += 1
      end
      temp = temp.next
      i+=1
    end
  end

  def remove(index)
    temp = @head
    if index == 0
      @head = @head.next
      temp.next = nil
      @length -= 1
      return
    end
    i = 0
    while(i<index)
      if(i == @length-1)
        temp.next = nil
        @tail = temp
        @length -= 1
        return
      end
      if(i==index-1)
        del_node = temp.next
        temp.next = del_node.next
        del_node.next = nil
      end
      temp = temp.next
      i+=1
    end
  end

  def values
    values = []
    temp = @head
    while(temp != nil)
      values.append(temp.value)
      temp = temp.next
    end
    values
  end

  def reverse
    prev = nil
    @tail = @head
    while(@head != nil)
      temp = @head
      @head = @head.next
      temp.next = prev
      prev = temp
    end
    @head = temp
  end
end


linked_list = LinkedList.new
linked_list.append(1)
linked_list.append(2)
linked_list.append(3)
linked_list.append(5)
p linked_list.length
p linked_list.values
linked_list.prepend(0)
p linked_list.values
linked_list.insert(4, 4)
p linked_list.values
linked_list.remove(4)
p linked_list.values
linked_list.reverse
p linked_list.values
