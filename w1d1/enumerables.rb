class Array

  def my_each(&blk)
    i = 0
    while i < self.length
      blk.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&blk)
    select_array = []
    i = 0
    while i < self.length
      select_array << self[i] if blk.call(self[i])
      i += 1
    end
    select_array
  end

  def my_reject(&blk)
    select_array = []
    i = 0
    while i < self.length
      select_array << self[i] if !(blk.call(self[i]))
      i += 1
    end
    select_array
  end

  def my_any?(&blk)
    i = 0
    while i < self.length
      return true if blk.call(self[i])
      i += 1
    end
    false
  end

  def my_all?(&blk)
    i = 0
    while i < self.length
      return false if !blk.call(self[i])
      i += 1
    end
    true
  end

  def my_flatten
    $flattened_array = [] if $flattened_array.nil?
    self.each do |el|
      if el.is_a?(Array)
        el.my_flatten
      else
        $flattened_array << el
      end
    end

    $flattened_array
  end

  def my_zip(*args)
    zipped_array = []
    self.length.times do |i|
      empty_array = []
      empty_array << self[i]
      args.each do |arr|
        empty_array << arr[i]
      end
      zipped_array << empty_array
    end
    zipped_array
  end

  def my_rotate(num = 1)
    if num < 0
      (num * -1).times do
        rotated_el = self.pop
        self.unshift(rotated_el)
      end
    else
      num.times do
        rotated_el = self.shift
        self << rotated_el
      end
    end
    self
  end

  def my_join(joiner = "")
    joinstring = ""

    self.each do |el|
      joinstring += (el + joiner)
    end
    joinstring.chop! if joiner != ""

    joinstring
  end

  def my_reverse
    i = self.length - 1
    reverse_array = []
    while i >= 0
      reverse_array << self[i]
      i -= 1
    end
    reverse_array
  end


end

if __FILE__ == $PROGRAM_NAME

  p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
  p [ 1 ].my_reverse               #=> [1]

end
