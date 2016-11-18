require_relative "tile"

class SudokuBoard

  attr_accessor :board

  def initialize
    @board = from_file

  end

  def from_file
    sudoku_arr = File.readlines("sudoku1.txt").map(&:chomp)
    new_arr = []
    sudoku_arr.each do |element|
      temp_arr = []
      element.split("").each do |num|
        temp_arr << Tile.new(num.to_i)
      end
      new_arr << temp_arr
    end
    new_arr
  end

  def update(pos, value)
    if self[pos].given
      p "This is a permanent tile"
    else
      self[pos].value = value
    end
  end

  def position

  end

  def render

  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def solved?
    solved_array = (1..9).to_a
    @board.each do |array|
      return false if array.sort != solved_array
    end
    9.times do |index1|
      temp_array = []
      9.times do |index2|
        temp_array << @board[index2][index1]
      end
      return false if temp_array.sort != solved_array
    end


  end
end

if __FILE__ == $PROGRAM_NAME
  test_game = SudokuBoard.new
  test_game.board
  p test_game.update([2,2],2)
end
