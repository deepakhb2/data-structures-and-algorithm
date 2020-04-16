=begin

Rules The game is played with a cubic die of  faces numbered  to .

Starting from square , land on square  with the exact roll of the die. If moving the number rolled would place the player beyond square , no move is made.

If a player lands at the base of a ladder, the player must climb the ladder. Ladders go up only.

If a player lands at the mouth of a snake, the player must go down the snake and come out through the tail. Snakes go down only.

Input: 
3
32 62
42 68
12 98
7
95 13
97 25
93 37
79 27
75 19
49 47
67 17

=end

def quickest_way_up(ladders, snakes)
  h_snakes, h_ladders = {}, {}
  ladders.each do |ladder|
    h_ladders[ladder[0]] = ladder[1]
  end
  snakes.each do |snake|
    h_snakes[snake[0]] = snake[1]
  end
  adj_nodes = {}
  (0...100).each do |node|
    (node+1..node+6).each do |i|
      next_pos = h_ladders[i] || h_snakes[i] || i 
      if(adj_nodes[node])
        adj_nodes[node] << next_pos if next_pos <= 100
      else
        adj_nodes[node] = [next_pos]
      end
    end
  end
  dist = {1 => 0}
  queue = [1]
  while(!queue.empty?)
    c_node = queue.shift
    adj_nodes[c_node].each do |neigh|
      if(!dist[neigh])
        queue.push(neigh) if neigh < 100
        dist[neigh] = dist[c_node] + 1
        return dist[neigh] if neigh == 100
      end
    end
  end
  return -1
end

ladders = [[32,62], [42, 68], [12, 98]]
snakes = [[95, 13], [97, 25], [93, 37], [79, 27], [75, 19], [49, 47], [67, 17]]
p quickest_way_up(ladders, snakes)