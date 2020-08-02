require './lib/display'

class Board
  include Colorable
  attr_accessor :board

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

  def game_over?
    horizontal_combo || vertical_combo || diagonal_combo
  end

  def full?
    board.all? { |line| line.all?(/\D/) }
  end

  private

  def horizontal_combo
    board.any? { |row| row.uniq.size == 1 }
  end

  def vertical_combo
    board.transpose.any? { |column| column.uniq.size == 1 }
  end

  def diagonal_combo
    diagonals = [[board[0][0], board[1][1], board[2][2]], 
                 [board[0][2], board[1][1], board[2][0]]]
    diagonals.any? { |diagonal| diagonal.uniq.size == 1 }
  end

  # def diagonal_combo
  #   board[0][0] == board[1][1] && board[0][0] == board[2][2] ||
  #     board[0][2] == board[1][1] && board[0][2] == board[2][0]
  # end
end