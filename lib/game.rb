require_relative 'display.rb'

class Game
  include Display
  attr_accessor :players, :current_player_idx, :board

  def initialize
    print display_intro
    @players = []
    @current_player_idx = 0
    @game_over = false
    create_player(1)
    create_player(2)
    play_game
  end

  def create_player(player_number)
    print display_name_prompt(player_number)
    name = gets.chomp.capitalize
    @players.push(Player.new(name))
    print display_good_luck(name)
  end

  def valid_move?
    until board.board.flatten.any?(@player_choice)
      puts display_error
      @player_choice = gets.chomp.to_i
    end
  end

  def make_move
    print display_player_turn
    @player_choice = gets.chomp.to_i
    valid_move?
    place_token
    board.show
  end

  def place_token
    board.board.each do |inner|
      inner.each_with_index do |num, idx|
        if num.eql?(@player_choice)
          inner[idx] = current_player_idx.zero? ? "X".magenta : "O".cyan
        end
      end
    end
    puts display_player_move
  end

  def current_player
    @players[@current_player_idx]
  end

  def next_player
    @current_player_idx = (@current_player_idx + 1) % 2
  end

  def game_finished?
    if board.game_over?
        @game_over = true
        puts display_winner
      elsif board.full?
        @game_over = true
        puts display_tie
      else
        next_player
    end
  end

  def play_game
    puts display_start
    @board = Board.new
    @board.show
    until @game_over do
      make_move
      game_finished?
    end
    repeat_game
  end

  def repeat_game
    puts display_play_again
    repeat_game = gets.chomp.upcase
    repeat_game.eql?('Y') ? (Game.new) : (puts closing_greeting)
  end
end
