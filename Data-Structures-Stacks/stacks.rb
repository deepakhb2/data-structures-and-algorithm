# Stacks using ruby Array

class Stack
  attr_reader :length

  def initialize
    @stack = []
    @length = 0
  end

  def push(value)
    @length += 1
    @stack.push(value)
  end

  def pop
    @length -= 1
    @stack.pop
  end

  def peek
    @stack[@length-1]
  end
  
  def isEmpty?
    @stack.empty?
  end

  def to_s
    p @stack
  end
end


stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)
p 'Lenght: '+ stack.length.to_s
p stack.pop
p 'Lenght: '+ stack.length.to_s
stack.push(4)
stack.push(5)
p stack.peek
p 'Lenght: '+ stack.length.to_s
p stack.pop
p 'Lenght: '+ stack.length.to_s