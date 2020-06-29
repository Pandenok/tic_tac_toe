require './display'
require './colorable'

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
    board.any? { |line| line.eql?([magenta("X"), magenta("X"), magenta("X")]) || 
        line.eql?([cyan("O"), cyan("O"), cyan("O")]) } ||
      board.transpose.any? { |line| line.eql?([magenta("X"), magenta("X"), magenta("X")]) || 
        line.eql?([cyan("O"), cyan("O"), cyan("O")]) } ||
      board[0][0] == board[1][1] && board[0][0] == board[2][2] ||
      board[0][2] == board[1][1] && board[0][2] == board[2][0]
  end

  def full?
    board.all? { |line| line.all?(/\D/) }
  end
end