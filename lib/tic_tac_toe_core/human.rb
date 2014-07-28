module TicTacToeCore
  class Human
    def make_move(move, board)
      board.mark_position(move, board.current_mark)
    end
  end
end
