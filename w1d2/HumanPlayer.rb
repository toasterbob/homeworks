require_relative 'board'

class HumanPlayer

  attr_accessor :name

  def initialize(name="Bob")
    @name = name
  end

  def prompt
    puts "please enter your move (i.e. 4,3)"
  end


end
