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

# q = Queue.new
# q.enqueue(2)
# q.enqueue(3)
# q.enqueue(4)
# q.show
# p q.dequeue
# p q.dequeue
# q.show
class Map
 attr_accessor :map

 def initialize
   @map = []
 end

 def assign(key, value)
  flag = true
  map.each_with_index do |el, i|
    if el[0] == key
      map[i][1] = value
      flag = false
    end
  end
  @map << [key, value] if flag
 end

 def lookup(key)
   map.each_with_index do |el, i|
     return el[1] if el[0] == key
   end
 end

 def remove(key)
   map.each_with_index do |el, i|
     map.delete(el) if el[0] == key
   end
 end

 def show
   p @map
 end

end
# m = Map.new
# m.assign("dog", true)
# m.assign("cat", true)
# m.show
# m.assign("dog", false)
# m.show
# p m.lookup("dog")
# m.remove("cat")
# p m.show
