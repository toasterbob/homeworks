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
class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.unshift(el)
  end

  def dequeue
    queue.pop
  end

  def show
    p queue
  end

end

q = Queue.new
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
q.show
p q.dequeue
p q.dequeue
q.show 
