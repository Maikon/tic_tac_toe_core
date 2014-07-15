require 'tic_tac_toe_core/game'
require 'tic_tac_toe_core/board'
require 'tic_tac_toe_core/computer'
require 'spec_helper'

describe TicTacToeCore::Game do
  let(:board)        { TicTacToeCore::Board.new }
  let(:game)         { TicTacToeCore::Game.new(board) }
  let(:winning_grid) { ['X', 'X', 'X', 4, 5, 6, 7, 8, 9] }
  let(:full_grid)    { ['X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O'] }

  describe '#has_winner?' do
    it 'returns true if there is a winner' do
      board = TicTacToeCore::Board.new(winning_grid)
      game = TicTacToeCore::Game.new(board)
      expect(game.has_winner?).to eq true
    end

    it 'returns false if there is no winner' do
      expect(game.has_winner?).to eq false
    end
  end

  describe '#is_draw?' do
    it 'returns true if the game is a draw' do
      board = TicTacToeCore::Board.new(full_grid)
      game = TicTacToeCore::Game.new(board)
      expect(game.is_draw?).to eq true
    end

    it 'returns false if the game is not a draw' do
      expect(game.is_draw?).to eq false
    end
  end

  describe '#is_over?' do
    it 'returns true if the game has reached an end state' do
      board = TicTacToeCore::Board.new(winning_grid)
      game = TicTacToeCore::Game.new(board)
      expect(game.is_over?).to eq true
    end

    it 'returns false if the game has not reached an end state' do
      expect(game.is_over?).to eq false
    end
  end

  describe '#play_next_move' do
    it 'marks the given position on the board' do
      game.play_next_move(1)
      expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
      game.play_next_move(5)
      expect(board.grid).to eq ['X', 2, 3, 4, 'O', 6, 7, 8, 9]
    end
  end

  describe '#computer_makes_move' do
    it 'computer makes a move on the board' do
      board = TicTacToeCore::Board.new(['X', 'X', 3, 4, 'O', 6, 7, 8, 9])
      game = TicTacToeCore::Game.new(board)
      game.computer_makes_move
      expect(board.grid).to eq ['X', 'X', 'O', 4, 'O', 6, 7, 8, 9]
    end
  end

  describe '#reset' do
    it 'resets the board' do
      board = TicTacToeCore::Board.new(full_grid)
      game = TicTacToeCore::Game.new(board)
      game.reset
      expect(board.grid).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end

  describe '#board_grid' do
    it "returns the board's grid" do
      expect(game.board_grid).to eq board.grid
    end
  end

  describe '#current_mark' do
    it 'returns the current mark' do
      expect(game.current_mark).to eq 'X'
    end
  end

  describe '#last_move_mark' do
    it 'returns the mark of the last move made' do
      board = TicTacToeCore::Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      game = TicTacToeCore::Game.new(board)
      expect(game.last_move_mark).to eq 'X'
    end
  end

  describe '#valid_move?' do
    it 'returns true if the move is valid' do
      expect(game.valid_move?(1)).to eq true
    end

    it 'returns false if move is not valid' do
      expect(game.valid_move?('X')).to eq false
    end
  end
end
