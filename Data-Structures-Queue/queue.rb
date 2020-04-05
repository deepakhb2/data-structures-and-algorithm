# Queues using ruby LinkedList 
#
class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class Queue
  attr_reader :length

  def initialize
    @front, @rear = nil, nil
    @length = 0
  end

  def enqueue(value)
    new_node = Node.new(value)
    unless(@rear)
      @front = @rear = new_node
      @length += 1
    else
      @rear.next = new_node 
      @rear = new_node
      @length += 1
    end
  end

  def dequeue
    if(@length > 1)
      temp_node = @front
      @front = temp_node.next
      temp_node.next = nil      
      @length -= 1
    else
      temp_node = @front
      @front = @rear = nil
      @length -= 1
    end
    temp_node.value if temp_node
  end

  def values
    values = []
    temp = @front
    while(temp != nil)
      values.append(temp.value)
      temp = temp.next
    end
    values
  end

  def peek
    @front.value
  end
  
  def isEmpty?
    @length == 0
  end
end

p 'Queues START'
queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
p queue.dequeue
p queue.dequeue
p queue.peek
p "Length: #{queue.length}"
p 'Queues END'