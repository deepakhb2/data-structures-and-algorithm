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
        if(current_node.right && current_node.right.left)
          temp_node = current_node.right.left
          temp_node.left = current_node.left
          temp_node.right = current_node.right
          if(parent_node)
            parent_node.left = temp_node if parent_node.left.value == current_node.value
            parent_node.right = temp_node if parent_node.right.value == current_node.value
          end
          @root = temp_node if current_node.value == @root.value
          current_node = nil
        elsif(current_node.right)
          temp_node = current_node.right
          if(parent_node)
            parent_node.left = temp_node if parent_node.left && parent_node.left.value == current_node.value
            parent_node.right = temp_node if parent_node.right && parent_node.right.value == current_node.value 
          end
          @root = temp_node if current_node.value == @root.value
          current_node = nil
        elsif(current_node.left)
          temp_node = current_node.left
          if(parent_node)
            parent_node.left = temp_node if parent_node.left && parent_node.left.value == current_node.value
            parent_node.right = temp_node if parent_node.right && parent_node.right.value == current_node.value 
          end
          @root = temp_node if current_node.value == @root.value
          current_node = nil
        else
          if(parent_node)
            parent_node.left = nil if parent_node.left && parent_node.left.value == current_node.value
            parent_node.right = nil if parent_node.right && parent_node.right.value == current_node.value 
          end
          @root = nil if current_node.value == @root.value
          current_node = nil
        end
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

bst = BinarySearchTree.new
bst.insert(50)
bst.insert(45)
bst.insert(55)
bst.insert(53)
bst.insert(60)
bst.delete(50)
p bst.root.value
bst.delete(45)
bst.delete(55)
bst.delete(53)
bst.delete(60)
p bst.root
