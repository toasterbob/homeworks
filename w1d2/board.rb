require_relative 'card'

class Board
  attr_accessor :grid, :width, :length

  def initialize(width = 6, length = 6)
    @width = width
    @length = length
    @grid = Array.new(width) {Array.new (length)}
    self.populate
  end

  def populate()
    total = width*length/2
    value_array=(1..total).to_a + (1..total).to_a
    shuffled_array = value_array.shuffle

    (0..width-1).each do |idx1|
      (0..length-1).each do |idx2|
        @grid[idx1][idx2] = Card.new(shuffled_array.pop)
      end
    end
  end

  def render
    spacing = "     "
    print " "
    length.times do |i|
      print "#{spacing}#{i}"
    end
    print "\n\n"

    width.times do |i|
      print "#{i}#{spacing}"
      @grid[i].each do |el|
        print "#{el.to_s}#{spacing}"
      end
      print "\n\n"
    end
  end

  def won?
    (0..width-1).each do |idx1|
      (0..length-1).each do |idx2|
        return false unless @grid[idx1][idx2].up
      end
    end
    true
  end

  def reveal(guessed_pos)
    x, y = guessed_pos
    @grid[x][y].reveal
    @grid[x][y].face_value
  end

end
