require './lib/colorable'

module Display
  include Colorable 

  def display_intro
    puts green('Tic-Tac-Toe').center(80)
    puts green('-----------').center(80)
    puts green("Let's have fun!\n").center(80)
  end

  def display_start
    puts green("Let's rock-n-roll!!!")
  end

  def display_name_prompt(player_number)
    player_number == 1 ? (print green("Who will play X's?")) : (print green("Who will play O's?"))
  end

  def display_good_luck(name)
    puts green("Good luck, #{name}!")
  end

  def display_winner
    puts green("You have won the game, #{current_player.name}! Congratulations!")
  end

  def display_tie
    puts green("#{current_player.name} and #{players[next_player].name}, it's a tie!!!")
  end

  def display_error
    print "#{bg_red("ERROR!")} #{red("The position #{@player_input} is not available. Try again please!")}"
  end

  def display_player_turn
    print green("\nYour turn, #{current_player.name}...\nPlease digit the number of the cell where to place your token: ")
  end

  def display_player_move
    puts green("#{current_player.name} placed his token to the position #{@player_input}.")
  end

  def display_play_again
    green("Would you like to play a new game? Press 'Y' for Yes or 'N' for No.")
  end

  def display_farewell
    green("Thank you for playing! Have a great day, #{current_player.name} and #{players[next_player].name}!")
  end
end
