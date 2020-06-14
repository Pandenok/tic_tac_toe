class String

  def green
    "\e[32m#{self}\e[0m"
  end

  def red
    "\e[31m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end
 
  def cyan
    "\e[36m#{self}\e[0m"
  end

  def bg_red
    "\e[41m#{self}\e[0m"
  end

  def no_colors
    self.gsub /\e\[\d+m/, ""
  end

end

module Display
  def display_intro
    puts 'Tic-Tac-Toe'.center(80).green
    puts '-----------'.center(80).green
    puts "Let's have fun!\n".center(80).green
  end

  def display_start
    puts "Let's rock-n-roll!!!".green
  end

  def display_name_prompt(player_number)
    player_number == 1 ? (puts "Who will play X's?".green) : (puts "Who will play O's?".green)
  end

  def display_good_luck(name)
    puts "Good luck, #{name}!".green
  end

  def display_winner
    puts "You have won the game, #{current_player.name}! Congratulations!".green
  end

  def display_tie
    puts "#{current_player.name} and #{players[next_player].name}, it's a tie!!!".green
  end

  def display_error
    puts "ERROR!".bg_red
    puts "The position #{@player_choice} is not available. Try again please!".green
  end

  def display_player_turn
    puts "\nYour turn, #{current_player.name}...\nPlease digit the number of the cell where to place your token:".green
  end

  def display_player_move
    puts "#{current_player.name} placed his token to the position #{@player_choice}.".green
  end

  def display_play_again
    "Would you like to play a new game? Press 'Y' for Yes or 'N' for No.".green
  end

  def closing_greeting
    "Thank you for playing! Have a great day, #{current_player.name} and #{players[next_player].name}!".green
  end
end
