# Unweighted Undirected Graph
# Using Adjacent list

class WeightedGraph
  attr_accessor :num_nodes, :num_edges

  def initialize
    @num_nodes = 0
    @num_edges = 0
    @adjacent_list = {}
  end

  def add_vertex(node)
    @adjacent_list[node] = {}
    @num_nodes += 1
  end

  def add_edge(node1, node2, value)
    @adjacent_list[node1][node2] = value
    @adjacent_list[node2][node1] = value
    @num_edges += 1
  end

  def remove_edge(node1, node2)
    @adjacent_list[node1].delete(node2)
    @adjacent_list[node2].delete(node1)
    @num_edges -= 1
  end

  def show_connection
    @adjacent_list.each do |node, edges|
      print node
      print '--->'
      print edges
      puts ''
    end
  end
end

my_graph = WeightedGraph.new
my_graph.add_vertex('0')
my_graph.add_vertex('1')
my_graph.add_vertex('2')
my_graph.add_vertex('3')
my_graph.add_vertex('4')
my_graph.add_vertex('5')
my_graph.add_vertex('6')
my_graph.add_edge('0', '1', 2)
my_graph.add_edge('1', '2', 2)
my_graph.add_edge('1', '4', 4)
my_graph.add_edge('2', '3', 6)
my_graph.add_edge('4', '5', 4)
my_graph.add_edge('3', '6', 2)
my_graph.add_edge('5', '6', 5)
my_graph.add_edge('2', '5', 1)
#my_graph.add_edge('5', '3', 2)
p my_graph
my_graph.show_connection
p "Num of edges: #{my_graph.num_edges}"
my_graph.remove_edge('0', '5')
my_graph.remove_edge('1', '2')
p "Num of edges: #{my_graph.num_edges}"
my_graph.show_connection
