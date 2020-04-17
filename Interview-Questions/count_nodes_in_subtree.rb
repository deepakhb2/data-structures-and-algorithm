=begin

Nodes in a Subtree
You are given a tree that contains N nodes, each containing an integer u which corresponds to a lowercase character c in the string s using 1-based indexing.
You are required to answer Q queries of type [u, c], where u is an integer and c is a lowercase letter. The query result is the number of nodes in the subtree of node u containing c.
Signature
int[] countOfNodes(Node root, ArrayList<Query> queries, String s)
Input
A pointer to the root node, an array list containing Q queries of type [u, c], and a string s
Constraints
N and Q are the integers between 1 and 1,000,000
u is an integer between 1 and N
s is of the length of N, containing only lowercase letters
c is a lowercase letter contained in string s
Node 1 is the root of the tree
Output
An integer array containing the response to each query
Example
        1(a)
        /   \
      2(b)  3(a)
s = "aba"
RootNode = 1
query = [[1, 'a']]
Note: Node 1 corresponds to first letter 'a', Node 2 corresponds to second letter of the string 'b', Node 3 corresponds to third letter of the string 'a'.
output = [2]
Both Node 1 and Node 3 contain 'a', so the number of nodes within the subtree of Node 1 containing 'a' is 2.

=end

class Node
  attr_reader :value
  attr_accessor :children 
  
  def initialize(value, children)
    @value = value
    @children = children
  end
end

# Should use the substring to count.
def count_of_nodes(root, queries, s)
  output = []
  queries.each do |query|
    r_node = nil
    queue = [root]
    while(queue.size > 0)
      temp_node = queue.shift
      if(temp_node.value == query[0])
        r_node = temp_node
        break
      else
        queue = queue + temp_node.children
      end
    end
    queue = [r_node]
    count = 0
    while(queue.size > 0)
      temp_node = queue.shift
      if(s[temp_node.value-1] == query[1])
        count+=1
      end
      queue = queue + temp_node.children
    end
    output << count
  end
  output
end

node4 = Node.new(4, [])
node1 = Node.new(2, [node4])
node2 = Node.new(3, [])
node3 = Node.new(1, [node1, node2])

p count_of_nodes(node3, [[1, 'a']], 'abaa')