=begin
Signature
int visibleNodes(Node root) {
Input
The root node of a tree, where the number of nodes is between 1 and 1000, and the value of each node is between 0 and 10,000,000,000
Output
An int representing the number of visible nodes.
Example
            8  <------ root
           / \
         3    10
        / \     \
       1   6     14
          / \    /
         4   7  13            
output = 4
=end

class Node
  attr_reader :value
  attr_accessor :left, :right
  
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_reader :root
  
  def initialize
    @root = nil
  end
  
  def insert(value)
    new_node = Node.new(value)
    unless @root
      @root = new_node
    else
      temp_node = @root
      while(temp_node)
        if(temp_node.value > value)
          unless(temp_node.left)
            temp_node.left = new_node
            return
          end
          temp_node = temp_node.left
        else
          unless(temp_node.right)
            temp_node.right = new_node
            return
          end
          temp_node = temp_node.right
        end
      end
    end
  end
end


def visible_node(root, left_most_node = {}, level=0)
  if(level == 0)
    left_most_node[level] = root.value
  end
  return left_most_node[level-1] unless root
  level = level+1
  unless(left_most_node[level])
      if(root.left)
        left_most_node[level] = root.left.value
      elsif(root.right)
        left_most_node[level] = root.right.value
      end
  end
  visible_node(root.left, left_most_node, level)
  visible_node(root.right, left_most_node, level)
end

bst = BinaryTree.new
bst.insert(8)
bst.insert(3)
bst.insert(1)
bst.insert(6)
bst.insert(4)
bst.insert(7)
bst.insert(10)
bst.insert(14)
bst.insert(13)
bst.insert(15)
bst.insert(16)
p visible_node(bst.root)
