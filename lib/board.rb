class Board
  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def show
    puts "\t--+---+---".green
    board.each do |inner|
      puts "\t" + inner.each { |cell| cell }.join(' | '.green)
      puts "\t--+---+---".green
    end
  end

  def game_over?
    board.any? { |line| line.eql?(["X".magenta, "X".magenta, "X".magenta]) || 
        line.eql?(["O".cyan, "O".cyan, "O".cyan]) } ||
      board.transpose.any? { |line| line.eql?(["X".magenta, "X".magenta, "X".magenta]) || 
        line.eql?(["O".cyan, "O".cyan, "O".cyan]) } ||
      board[0][0] == board[1][1] && board[0][0] == board[2][2] ||
      board[0][2] == board[1][1] && board[0][2] == board[2][0]
  end

  def full?
    board.all? { |line| line.all?(/\D/) }
  end
end