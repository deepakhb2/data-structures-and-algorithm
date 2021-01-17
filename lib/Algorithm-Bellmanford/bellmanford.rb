require_relative '../Data-Structures-Graph/weighted_graph'

class WeightedGraph
  def bellmanford(source)
    dist = {}
    shortest_path = {}
    @adjacent_list.keys.each do |node|
      dist[node] = Float::INFINITY
    end
    dist[source] = 0
    shortest_path[source] = [source]
    @adjacent_list.keys.each do |node|
      @adjacent_list[node].each do |neighbor, distance|
        min_dist = dist[node] + distance
        if min_dist < dist[neighbor]
          dist[neighbor] = min_dist
          shortest_path[neighbor] = shortest_path[node] + [neighbor]
        end
      end
    end

    @adjacent_list.keys.each do |node|
      @adjacent_list[node].each do |neighbor, distance|
        if dist[node] + @adjacent_list[node][neighbor] < distance
          return 'Negative cycle exists!', ''
        end
      end
    end

    return dist, shortest_path
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
my_graph.add_edge('5', '6', -2)
my_graph.add_edge('5', '3', -2)
my_graph.add_edge('2', '5', 1)
p 'Bellmanford Algorithm: '
distance, shortest_path = my_graph.bellmanford('0')
p 'Distance from source: ', distance
p 'Shortest path from source: ', shortest_path
p 'Bellmanford Algorithm'
