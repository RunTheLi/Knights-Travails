class Board
  MOVES = [
    [-2, -1], [-2, 1], [2, -1], [2, 1],
    [-1, -2], [-1, 2], [1, -2], [1, 2]
  ]

  def initialize(size = 8)
    @size = size
    @board = Array.new(size) { Array.new(size, '⬜') }
    @knight = nil
  end

  def valid_move?(x, y)
    x.between?(0, @size - 1) && y.between?(0, @size - 1)
  end

  def knight_moves(start, target)
    queue = [[start, [start]]]
    visited = Array.new(@size) { Array.new(@size, false) }

    until queue.empty?
      current_position, path = queue.shift
      x, y = current_position

      return path if current_position == target # Found the shortest path

      next if visited[x][y]

      visited[x][y] = true

      MOVES.each do |dx, dy|
        new_x = x + dx
        new_y = y + dy
        queue << [[new_x, new_y], path + [[new_x, new_y]]] if valid_move?(new_x, new_y) && !visited[new_x][new_y]
      end
    end
  end

  def display
    puts '  ' + (0...@size).map(&:to_s).join(' ')
    @board.each_with_index do |row, i|
      puts "#{i} " + row.join(' ')
    end
  end

  def move_knight(start, target)
    path = knight_moves(start, target)
    return puts 'Invalid move!' unless path

    puts "You made it in #{path.length - 1} moves! Here's your path:"

    path.each_with_index do |pos, index|
      x, y = pos
      @board.each { |row| row.map! { 'X' } } # Clear board
      @board[x][y] = '♞' # Place knight
      display
      sleep(1) unless index == path.length - 1 # Pause between moves
    end
  end
end

# 🚀 Playable version
board = Board.new
board.move_knight([3, 3], [4, 3])
board.move_knight([3, 3], [0, 0])
board.move_knight([0, 0], [3, 3])
board.move_knight([0, 0], [7, 7])
