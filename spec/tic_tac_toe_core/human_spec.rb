require 'tic_tac_toe_core/human'
require 'tic_tac_toe_core/board'

describe TicTacToeCore::Human do
  it 'makes a move on the board' do
    human = TicTacToeCore::Human.new
    board = TicTacToeCore::Board.new
    human.make_move(1, board)
    expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
