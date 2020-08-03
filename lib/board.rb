require './lib/display'

class Board
  include Colorable
  include Display

  attr_reader :board

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def show
    puts green("\t--+---+---")
    board.each do |inner|
      puts "\t" + inner.each { |cell| cell }.join(green(' | '))
      puts green("\t--+---+---")
    end
  end

  def place_token(player_input, current_player_idx)
    board.each do |inner|
      inner.each_with_index do |num, idx|
        if num.eql?(player_input)
          inner[idx] = current_player_idx.zero? ? magenta('X') : cyan('O')
        end
      end
    end
  end

  def valid_move?(player_input)
    board.flatten.any?(player_input)
  end

  def game_over?
    horizontal_combo? || vertical_combo? || diagonal_combo?
  end

  def full?
    board.all? { |line| line.all?(/\D/) }
  end

  private

  def horizontal_combo?
    board.any? { |row| row.uniq.size == 1 }
  end

  def vertical_combo?
    board.transpose.any? { |column| column.uniq.size == 1 }
  end

  def diagonal_combo?
    first_diagonal = (0..2).map { |i| board[i][i] }
    second_diagonal = (0..2).map { |i| board.reverse[i][i] }
    diagonals = [first_diagonal, second_diagonal]
    diagonals.any? { |diagonal| diagonal.uniq.size == 1 }
  end
end
