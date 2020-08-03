require './lib/board'

describe Board do
  subject(:test_board) { described_class.new }

  describe "#place_token" do
    context 'when receives a call from Game with player\'s move' do
      it 'updates the board by placing a token' do
        player_input = 5
        current_player_idx = 0
        updated_board = [[1, 2, 3], [4, "\e[35mX\e[0m", 6], [7, 8, 9]]

        test_board.place_token(player_input, current_player_idx)
        expect(test_board.board).to eq(updated_board)
      end
    end
  end

  describe "#valid_move?" do
    context 'when the input value is found on the board' do
      it 'is a valid move' do
        player_input = 5
        test_board.instance_variable_set(:@board, [["X", "X", "O"], ["O", 5, "X"], ["X", "O", "O"]])
        player_move = test_board.valid_move?(player_input)
        
        expect(player_move).to be true
      end
    end

    context 'when the input value is not on the board' do
      it 'is not a valid move' do
        player_input = 45
        test_board.instance_variable_set(:@board, [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        player_move = test_board.valid_move?(player_input)
        
        expect(player_move).to be false
      end
    end
  end

  describe "#game_over?" do
    context 'when reads three identical tokens across the row' do
      it 'is game over' do
        test_board.instance_variable_set(:@board, [%w[X X X], [4, 5, 6], [7, 8, 9]])
        expect(test_board).to be_game_over
      end
    end

    context 'when reads three identical tokens across the column' do
      it 'is game over' do
        test_board.instance_variable_set(:@board, [["X", 2, 3], ["X", 5, 6], ["X", 8, 9]])
        expect(test_board).to be_game_over
      end
    end

    context 'when reads three identical tokens across the diagonal' do
      it 'is game over' do
        test_board.instance_variable_set(:@board, [["X", 2, 3], [4, "X", 6], [7, 8, "X"]])
        expect(test_board).to be_game_over
      end
    end

    context 'when there is no sequence of three identical tokens' do
      it 'is not game over' do
        test_board.instance_variable_set(:@board, [["X", "X", "O"], ["O", "X", "X"], ["X", "O", "O"]])
        expect(test_board).to_not be_game_over
      end
    end

  end

  describe "#full?" do
    context 'when no more space available to place a token' do 
      it 'is full' do
        test_board.instance_variable_set(:@board, [["X", "X", "O"], ["X", "X", "O"], ["O", "O", "X"]])
        expect(test_board).to be_full
      end
    end

    context 'when there is space to place a token' do
      it 'is not full' do
        test_board.instance_variable_set(:@board, [[1, 2, 3], [4, "X", 6], [7, 8, "X"]])
        expect(test_board).to_not be_full
      end
    end
  end
end