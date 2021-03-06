require 'tic_tac_toe_core/board'

describe TicTacToeCore::Board do
  let(:board) { TicTacToeCore::Board.new }
  let(:grid_with_one_move) { ['X', 1, 2, 3, 4, 5, 6, 7, 8] }

  describe '#mark_position' do
    it 'marks a position on grid with an X' do
      board.mark_position(0, 'X')
      expect(board.grid).to eq grid_with_one_move
    end

    it 'raises an error if the position is taken' do
      board = TicTacToeCore::Board.new(grid_with_one_move)
      expect{ board.mark_position(0, 'O') }.to raise_error
    end
  end

  describe '#winner' do
    [['X', 'X', 'X', 3, 4, 5, 6, 7, 8],
     [0, 1, 2, 'X', 'X', 'X', 6, 7, 8],
     [0, 1, 2, 3, 4, 5, 'X', 'X', 'X'],
     ['X', 1, 2, 'X', 4, 5, 'X', 7, 8],
     [0, 'X', 2, 3, 'X', 5, 6, 'X', 8],
     [0, 1, 'X', 3, 4, 'X', 6, 7, 'X'],
     ['X', 1, 2, 3, 'X', 5, 6, 7, 'X'],
     [0, 1, 'X', 3, 'X', 5, 'X', 7, 8]].each do |combo|
       it "returns true if there's a win" do
        board = TicTacToeCore::Board.new(combo)
        expect(board.winner?).to eq true
       end
     end

     it "returns false if there's no win" do
       expect(board.winner?).to eq false
     end
  end

  describe '#available_moves' do
    it 'returns the available moves from the board' do
      board = TicTacToeCore::Board.new(['X', 'O', 2, 'X', 4, 5, 6, 'X', 8])
      expect(board.available_moves).to eq [2, 4, 5, 6, 8]
      another_board = TicTacToeCore::Board.new(grid_with_one_move)
      expect(another_board.available_moves).to eq [1, 2, 3, 4, 5, 6, 7, 8]
    end
  end

  describe '#current_mark' do
    it 'returns X if no move was made on the board' do
      expect(board.current_mark).to eq 'X'
    end

    it 'returns O if a move was made on the board' do
      board = TicTacToeCore::Board.new(grid_with_one_move)
      expect(board.current_mark).to eq 'O'
    end
  end

  describe '#game_over?' do
    it 'returns true if the board has a winner' do
      board = TicTacToeCore::Board.new(['X', 'X', 'X', 3, 4, 5, 6, 7, 8])
      expect(board.game_over?).to eq true
    end

    it 'returns true if the board has no available moves' do
      board = TicTacToeCore::Board.new(['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'])
      expect(board.game_over?).to eq true
    end
  end

  describe '#last_mark' do
    it "returns X if it's O turn to make a move" do
      board = TicTacToeCore::Board.new(grid_with_one_move)
      expect(board.last_move_mark).to eq 'X'
    end

    it "returns O if it's X turn to make a move" do
      board = TicTacToeCore::Board.new(['X', 1, 'O', 3, 4, 5, 6, 7, 8])
      expect(board.last_move_mark).to eq 'O'
    end
  end

  describe '#reset_value' do
    it 'resets the value at the given cell' do
      board = TicTacToeCore::Board.new(grid_with_one_move)
      board.reset_value(0)
      expect(board.grid).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8]
    end
  end

  describe '#win_for' do
    it 'returns true if the mark given has won' do
      board = TicTacToeCore::Board.new([0, 'X', 'X', 3, 4, 5, 6, 7, 8])
      expect(board.win_for('X')).to eq false
      board.mark_position(0, 'X')
      expect(board.win_for('X')).to eq true
    end
  end

  describe '#draw' do
    it 'returns true if there are no moves left' do
      board = TicTacToeCore::Board.new(['X', 1, 'O', 'O', 'X', 'X', 'X', 'O', 'O'])
      expect(board.draw?).to eq false
      board.mark_position(1, 'X')
      expect(board.draw?).to eq true
    end
  end

  describe '#reset' do
    it 'resets the board' do
      board = TicTacToeCore::Board.new(['X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O'])
      board.reset
      expect(board.grid).to eq [0, 1, 2, 3, 4, 5, 6, 7, 8]
    end
  end
end
