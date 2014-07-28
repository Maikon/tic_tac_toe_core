require 'tic_tac_toe_core/computer'
require 'tic_tac_toe_core/board'

describe TicTacToeCore::Computer do
  describe '#choose_mark' do
    it 'chooses O if available_moves is even' do
      board = TicTacToeCore::Board.new(['X', 1, 2, 3, 4, 5, 6, 7, 8])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.mark).to eq 'O'
    end

    it 'chooses X if available_moves is odd' do
      board = TicTacToeCore::Board.new
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.mark).to eq 'X'
    end
  end

  describe '#make_move' do
    it 'makes a move on the board' do
      board = TicTacToeCore::Board.new(['X', 1, 2, 'X', 'O', 5, 6, 7, 8])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      computer.make_move(board)
      expect(board.grid).to eq ['X', 1, 2, 'X', 'O', 5, 'O', 7, 8]
    end
  end

  describe '#minimax' do
    it 'returns winning move' do
      board = TicTacToeCore::Board.new(['X', 'X', 2, 'O', 4, 5, 'O', 7, 8])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 2
    end

    it 'returns move preventing loss' do
      board = TicTacToeCore::Board.new([0, 'O', 2, 'X', 4, 5, 'X', 7, 8])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 0
    end

    it 'returns move preventing diagonal fork' do
      board = TicTacToeCore::Board.new(['X', 1, 2, 3, 'O', 5, 6, 7, 'X'])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 1
    end

    it 'returns move preventing alternative diagonal fork' do
      board = TicTacToeCore::Board.new(['O', 1, 2, 3, 'X', 5, 6, 7, 'X'])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 2
    end

    it 'returns move preventing edge trap' do
      board = TicTacToeCore::Board.new([0, 'X', 2, 'X', 'O', 5, 6, 7, 8])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 0
    end

    it 'returns move preventing reverse edge trap' do
      board = TicTacToeCore::Board.new([0, 1, 2, 3, 'O', 'X', 6, 'X', 8])
      computer = TicTacToeCore::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 2
    end
  end
end
