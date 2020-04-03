# Unweighted Undirected Graph
# Using Adjacent list

class UnweightedGraph
  attr_accessor :num_nodes, :num_edges

  def initialize
    @num_nodes = 0
    @num_edges = 0
    @adjacent_list = {}
  end

  def add_vertex(node)
    @adjacent_list[node] = []
    @num_nodes += 1
  end

  def add_edge(node1, node2)
    @adjacent_list[node1] << node2
    @adjacent_list[node2] << node1
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

my_graph = UnweightedGraph.new
my_graph.add_vertex('0')
my_graph.add_vertex('1')
my_graph.add_vertex('2')
my_graph.add_vertex('3')
my_graph.add_vertex('4')
my_graph.add_vertex('5')
my_graph.add_vertex('6')
my_graph.add_edge('3', '1')
my_graph.add_edge('3', '4')
my_graph.add_edge('4', '2') 
my_graph.add_edge('4', '5') 
my_graph.add_edge('1', '2') 
my_graph.add_edge('1', '0') 
my_graph.add_edge('0', '2') 
my_graph.add_edge('6', '5')
p my_graph
my_graph.show_connection
p "Num of edges: #{my_graph.num_edges}"
my_graph.remove_edge('0', '5')
my_graph.remove_edge('1', '2')
p "Num of edges: #{my_graph.num_edges}"
my_graph.show_connection
