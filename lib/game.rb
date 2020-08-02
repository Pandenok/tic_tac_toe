# frozen_string_literal: true

require './lib/display'
require './lib/colorable'

class Game
  include Display
  include Colorable

  attr_accessor :players, :current_player_idx, :board

  def initialize
    @board = Board.new
    @players = []
    @current_player_idx = 0
  end

  def play
    configure_new_game
    make_move until board.game_over? || board.full?
    game_finished?
    repeat_game
  end

  def create_player(player_number)
    puts display_name_prompt(player_number)
    name = gets.chomp.capitalize
    @players.push(Player.new(name))
    puts display_good_luck(name)
  end

  def make_move
    print display_player_turn
    @player_input = gets.chomp.to_i
    valid_move?
    place_token
    board.show
    next_player
  end

  private

  def configure_new_game
    puts display_intro
    create_player(1)
    create_player(2)
    puts display_start
    board.show
  end

  def place_token
    token_x = magenta('X')
    token_o = cyan('O')
    board.board.each do |inner|
      inner.each_with_index do |num, idx|
        if num.eql?(@player_input)
          inner[idx] = current_player_idx.zero? ? token_x : token_o
        end
      end
    end
    puts display_player_move
  end

  def valid_move?
    until board.board.flatten.any?(@player_input)
      puts display_error
      @player_input = gets.chomp.to_i
    end
  end

  def current_player
    @players[@current_player_idx]
  end

  def next_player
    @current_player_idx = (@current_player_idx + 1) % 2
  end

  def game_finished?
    puts display_winner if board.game_over?
    puts display_tie if board.full?
  end

  def repeat_game
    puts display_play_again
    repeat_game = gets.chomp.upcase
    if repeat_game.eql?('Y')
      game = Game.new
      game.play
    else
      puts display_farewell
    end
  end
end
