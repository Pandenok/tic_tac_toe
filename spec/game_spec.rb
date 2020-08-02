require './lib/game'
require './lib/player'
require './lib/board'

describe Game do
  subject(:test_game) { described_class.new }
  
  describe '#create_player' do
    it 'creates player' do
      name = 'Tom'

      allow(test_game).to receive(:puts)
      allow(test_game).to receive(:display_name_prompt).with(1)
      allow(test_game).to receive(:gets).and_return(name)

      expect(Player).to receive(:new).with(name)
      test_game.create_player(1)
    end
  end

  describe '#make_move' do
    context 'when making a move' do
      it 'sends a message to the Board with player input' do
        @player_input = '5'
        current_player_idx = 0

        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:display_player_turn)
        allow(test_game).to receive(:gets).and_return(@player_input)
        allow(test_game).to receive(:display_player_move)
        allow(test_game.board).to receive(:show)

        expect(test_game.board).to receive(:place_token)
        test_game.make_move
      end
    end
  end

  describe '#play' do
    context 'when playing a game' do
      before do
        allow(test_game.board).to receive(:game_over?).and_return(false, false, true)
      end

      it 'loops until game over' do 
        allow(test_game).to receive(:configure_new_game)
        allow(test_game).to receive(:make_move)
        allow(test_game).to receive(:game_finished?)
        allow(test_game).to receive(:repeat_game)
        
        expect(test_game).to receive(:make_move).exactly(2).times
        test_game.play
      end
    end
  end
end