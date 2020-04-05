require_relative '../Data-Structures-Tree/binary_search_tree'
require_relative '../Data-Structures-Queue/queue'

# ex:
#        9
#    4       20
#  1   6  15    170
# bfs_values = [9, 4, 20, 1, 6, 15, 170]
# in_order_dfs_values = [1, 4, 6, 9, 15, 20, 170]
# pre_order_dfs_values = [9, 4, 1, 6, 20, 15, 170]
# post_order_dfs_values = [1, 6, 4, 15, 170, 20, 9]
class BinarySearchTree
  def i_dfs_in_order
    traverse_in_order(@root, [])
  end

  def traverse_in_order(root, values)
    if(root.left)
      traverse_in_order(root.left, values)
    end
    values << root.value
    if(root.right)
      traverse_in_order(root.right, values)
    end
    return values
  end

  def i_dfs_pre_order
    traverse_pre_order(@root, [])
  end

  def traverse_pre_order(root, values)
    values << root.value
    if(root.left)
      traverse_pre_order(root.left, values)
    end
    if(root.right)
      traverse_pre_order(root.right, values)
    end
    return values
  end

  def i_dfs_post_order
    traverse_post_order(@root, [])
  end

  def traverse_post_order(root, values)
    if(root.left)
      traverse_post_order(root.left, values)
    end
    if(root.right)
      traverse_post_order(root.right, values)
    end
    values << root.value
    return values
  end
end

binary_tree = BinarySearchTree.new
binary_tree.insert(9)
binary_tree.insert(4)
binary_tree.insert(6)
binary_tree.insert(20)
binary_tree.insert(170)
binary_tree.insert(15)
binary_tree.insert(1)
p 'DFS START'
p 'In Order: ', binary_tree.i_dfs_in_order
p 'Pre Order: ', binary_tree.i_dfs_pre_order
p 'Post Order: ', binary_tree.i_dfs_post_order
p 'DFS END'