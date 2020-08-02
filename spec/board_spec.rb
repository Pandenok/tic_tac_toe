require './lib/board'

describe Board do
  subject(:test) { described_class.new }

  context 'when reads three identical tokens across the row' do
    it 'is game over' do
      test.instance_variable_set(:@board, [%w[X X X], [4, 5, 6], [7, 8, 9]])
      expect(test).to be_game_over
    end
  end
  
  context 'when reads three identical tokens across the column' do
    it 'is game over' do
      test.instance_variable_set(:@board, [["X", 2, 3], ["X", 5, 6], ["X", 8, 9]])
      expect(test).to be_game_over
    end
  end
  
  context 'when reads three identical tokens across the diagonal' do
    it 'is game over' do
      test.instance_variable_set(:@board, [["X", 2, 3], [4, "X", 6], [7, 8, "X"]])
      expect(test).to be_game_over
    end
  end

  context 'when no more space available to place a token' do 
    it 'is full' do
      test.instance_variable_set(:@board, [["O", "X", "O"], ["X", "X", "O"], ["O", "O", "X"]])
      expect(test).to be_full
    end
  end
end