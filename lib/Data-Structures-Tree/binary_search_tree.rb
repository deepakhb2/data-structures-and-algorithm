class Node
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @left = nil
    @right = nil
    @value = value
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end
  
  # Check root and create root node
  # Traverse left or right depending on node value
  # Create new node and add as left or right child depending on node value.
  def insert(value)
    new_node = Node.new(value)
    unless(@root)
      @root = new_node
    else
      temp_node = @root
      traverse = true
      while(traverse)
        if(new_node.value < temp_node.value)
          unless(temp_node.left)
            traverse = false
            temp_node.left = new_node
          end
          temp_node = temp_node.left
        else
          unless(temp_node.right)
            traverse = false
            temp_node.right = new_node
          end
          temp_node = temp_node.right
        end
      end
    end
  end

  def lookup(value)
    current_node = @root
    while(current_node)
      if(current_node.value == value)
        return current_node
      elsif(value < current_node.value)
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end
  end

  # If the node is root
  # If the node has no children
  # If the node has only two child then remove the node make right child will be node.
  # If the node right child as children then right child's left child will become node.
  def delete(value)
    current_node = @root
    parent_node = nil
    while(current_node)
      if(current_node.value == value)
        if(current_node.right == nil)
          if(parent_node == nil)
            @root = current_node.left
          else
            if(current_node.value < parent_node.value)
              parent_node.left = current_node.left
            else
              parent_node.right = current_node.left
            end
          end
        elsif(current_node.right.left == nil)
          if(parent_node == nil)
            @root = current_node.right
          else
            if(current_node.value < parent_node.value)
              parent_node.left = current_node.right
            else
              parent_node.right = current_node.right
            end
          end
        else
          left_most = current_node.right.left
          left_most_parent = current_node.right
          while(left_most.left != nil)
            left_most_parent = left_most
            left_most = left_most.left
          end

          left_most_parent.left = left_most.right
          left_most.left = current_node.left
          left_most.right = current_node.right

          if(parent_node == nil)
            @root = left_most
          else
            if(current_node.value < parent_node.value)
              parent_node.left = left_most
            else
              parent_node.right = left_most
            end
          end
        end
        return current_node.value
      elsif(value < current_node.value)
        parent_node = current_node
        current_node = current_node.left
      else
        parent_node = current_node
        current_node = current_node.right
      end
    end
  end
end

p 'BST START'
bst = BinarySearchTree.new
bst.insert(50)
bst.insert(45)
bst.insert(55)
bst.insert(53)
bst.insert(60)
p bst.delete(50)
p bst.root.value
p bst.delete(45)
p bst.delete(55)
p bst.delete(53)
p bst.delete(60)
p bst.root
p 'BST END'
