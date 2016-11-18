#LIFO
class Stack
  attr_accessor :stack

    def initialize
      @stack = []
    end

    def add(el)
      stack << el
    end

    def remove
      stack.pop
    end

    def show
      p @stack
    end
  end

  # s = Stack.new
  # s.show
  # s.add(2)
  # s.add(3)
  # s.show
  # s.remove
  # s.show
  
