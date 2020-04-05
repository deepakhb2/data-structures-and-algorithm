require_relative '../Data-Structures-Tree/binary_search_tree'
require_relative '../Data-Structures-Queue/queue'

# ex:
#        9
#    4       20
#  1   6  15    170
# bfs_values = [9, 4, 20, 1, 6, 15, 170]
class BinarySearchTree
  # Using iterative approach
  def i_bfs
    values = []
    queue = Queue.new
    queue.enqueue(@root)
    while(queue.length > 0)
      node = queue.dequeue
      values << node.value
      if(node.left)
        queue.enqueue(node.left)
      end
      if(node.right)
        queue.enqueue(node.right)
      end
    end
    values
  end

  # Using recursive approach.
  def r_bfs(queue, values)
    if(queue.length == 0)
      return values
    end
    node = queue.dequeue
    values << node.value
    if(node.left)
      queue.enqueue(node.left)
    end
    if(node.right)
      queue.enqueue(node.right)
    end
    return r_bfs(queue, values)
  end

  def i_dfs
    values = []

    values
  end

  def r_dfs(queue, values)
    values
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
p 'BFS START'
p 'Iterative: ', binary_tree.i_bfs
queue = Queue.new
queue.enqueue(binary_tree.root)
p 'Recursive: ', binary_tree.r_bfs(queue, [])
p 'BFS END'