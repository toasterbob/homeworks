require_relative 'card'
require_relative 'board'
require_relative 'HumanPlayer'

class Game
  attr_accessor :board, :prev_position, :player

  def initialize(board=Board.new, player = HumanPlayer.new)
    @board = board
    @player = player
  end

  def play
    until board.won?
      system("clear")
      board.render
      p "first move"
      pos = get_move
      a, b = pos
      board.reveal(pos)
      system("clear")
      board.render
      p 'second move'
      pos2 = get_move
      c, d = pos2
      board.reveal(pos2)
      board.render

      sleep(3)
      if @board.grid[a][b].==(@board.grid[c][d])
        puts "you guessed correctly!"
        sleep(2)
      else
        @board.grid[a][b].hide
        @board.grid[c][d].hide
      end
    end
    p "You have won the game!"
  end

  def get_move
    player.prompt
    move = gets.chomp
    move = move.split(",").map { |el| el.to_i }
    until valid_move?(move)
      puts "please enter a valid move (i.e. 3,2)"
      move = gets.chomp
      move = move.split(",").map { |el| el.to_i }
    end
    move
  end

  def valid_move?(move)
    x, y = move
    return false if @board.grid[x][y].up
    x < @board.width && y < @board.length && x >=0 && y >= 0
  end

end



if __FILE__ == $PROGRAM_NAME
  board = Board.new(3,3)
  player = HumanPlayer.new("Frank")
  game = Game.new(board, player)
  game.play
end
