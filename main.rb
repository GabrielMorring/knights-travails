require_relative "lib/node"

def valid_point?(point)
  point.each { |num| return false if num.negative? || num > 7 }
  true
end

def move_list(node)
  return [node.point] if node.parent.nil?

  move_list(node.parent).push(node.point)
end

def knight_moves(first, last)
  [first, last].each do |point|
    unless valid_point?(point)
      puts "invalid points"
      return
    end
  end

  first_node = Node.new(first)

  prev_locations = [first]
  queue = [first_node]

  final_node = nil

  until queue.empty?

    node = queue.shift

    [
      [node.point[0] + 1, node.point[1] + 2],
      [node.point[0] + 2, node.point[1] + 1],
      [node.point[0] + 2, node.point[1] - 1],
      [node.point[0] + 1, node.point[1] - 2],
      [node.point[0] - 1, node.point[1] - 2],
      [node.point[0] - 2, node.point[1] - 1],
      [node.point[0] - 2, node.point[1] + 1],
      [node.point[0] - 1, node.point[1] + 2]
    ].each do |new_point|
      if valid_point?(new_point) && !prev_locations.include?(new_point)

        queue.push(Node.new(new_point, node))
        prev_locations.push(new_point)
      end
      if new_point == last
        final_node = Node.new(new_point, node)
        break
      end
    end

  end

  print move_list(final_node)
end

puts knight_moves([3, 3], [4, 4])
