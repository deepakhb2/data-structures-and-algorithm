=begin

https://www.hackerrank.com/challenges/bfsshortreach/problem

Output: 6 6 6 6 12 6 12 6 12 12 6 6 6 6 6 12 12 6 6 6 6 12 6 12 6 12 6 12 12 12 12 6 12 12 6 12 12 6 12 6 12 6 12 12 6 6 12 6 6 6 6 12 12 12 12 6 6 6 12 6 6 12 12 12 12 12 12 6 6
=end
require 'pry'

def bfs(n, m, edges, s)
  adj_list = {}
  dist = {}
  edges.each do |e|
    if(adj_list[e[0]])
      adj_list[e[0]][e[1]] = 6
    else
      adj_list[e[0]] = {e[1] => 6}
    end
    if(adj_list[e[1]])
      adj_list[e[1]][e[0]] = 6
    else
      adj_list[e[1]] = {e[0] => 6}
    end
  end

  queue = [s]
  dist[s] = 0
  while(!queue.empty?)
    node = queue.shift
    if(adj_list[node])
      adj_list[node].each do |neigh, val|
        if(!dist[neigh])
          queue.push(neigh) 
          dist[neigh] = dist[node] + val
        end
      end
    end
  end
  (1..n).to_a.each do |node|
    unless(dist[node])
      dist[node] = -1
    end
  end
  dist.delete(s)
  return dist.sort.collect(&:last)
end

n = 70
m = 1988
s = 16
edges = []
File.open("bfs_shortest_reach_input.txt") do |file|
  file.each do |line|
    line = line.gsub(/\n/,'')
    edges << line.split(" ").collect(&:to_i)
  end
end
p bfs(n, m, edges, s) 