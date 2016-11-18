require "set"

class Ghost
  attr_accessor :players, :fragment, :dictionary

  def initialize(players, fragment = "", dictionary = File.readlines("dictionary.txt").map(&:chomp))
    @players = players
    @fragment = fragment
    @dictionary = dictionary.to_set
  end

  def play_round
    players.each do |player|
      take_turn(player)
    end


  end

  def take_turn(player)
    guess = player.guess
    valid_play?(guess)
  end

  def valid_play?(string)
    alphabet = ("a".."z").to_a
    if alphabet.include?(string)
      tester = @fragment + string
      valid = dictionary.any? do |word|
        word.start_with?(tester)
      end
      return false if !valid
    else
      return false
    end
    true
  end

end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "What is your guess?"
    player_guess = gets.chomp
    player_guess.downcase
  end

  def alert_invalid_guess(guess)
    while alert_invalid_guess(player_guess)
      puts "Invalid guess, please guess again."
      player_guess = gets.chomp
    end
    player_guess
  end

end



if __FILE__ == $PROGRAM_NAME

  g = Ghost.new("A", "B")
  p g.dictionary
end
