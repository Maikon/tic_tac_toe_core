module TicTacToeCore
 class Board
   attr_reader :grid

   BOARD_SIZE = 3

   def initialize(grid = default_grid(BOARD_SIZE))
     @grid = grid
   end

   def mark_position(position, mark)
     raise 'Position already taken' unless grid.include?(position)
     grid[position] = mark
   end

   def draw?
     available_moves.empty?
   end

   def winner?
     winning_combinations.any? { |combo| combo.all? { |cell| cell == combo.first } }
   end

   def available_moves
     grid.select { |cell| cell.is_a? Fixnum }
   end

   def current_mark
     available_moves.length.odd? ? 'X' : 'O'
   end

   def last_move_mark
     current_mark == 'X' ? 'O' : 'X'
   end

   def game_over?
     winner? || draw?
   end

   def reset_value(value)
     grid[value] = value
   end

   def win_for(mark)
     winning_combinations.any? { |combo| combo.all? { |cell| cell == mark } }
   end

   def reset
     grid.each_with_index do |move, index|
       grid[index] = index
     end
   end

   private

   def winning_combinations
     rows + columns + diagonals
   end

   def rows
     grid.each_slice(BOARD_SIZE).to_a
   end

   def columns
     rows.transpose
   end

   def diagonals
     [] <<  rows.map.with_index { |row, index| row[index] } << rows.reverse.map.with_index { |row, index| row[index] }
   end

   def default_grid(size)
     index = size * size - 1
     (0..index).to_a
   end
 end
end
