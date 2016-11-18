require "byebug"

def pascal(n)
  return [1] if n == 1

  prev_row = pascal(n-1)
  next_row = [1]
  prev_row.each_with_index do |el, idx|
    second = prev_row[idx+1] || 0
    next_row << el + second
  end
  next_row
end

def range(start, ending)
  return [] if ending <= start+1
  range(start, ending - 1) << ending - 1
end
#p range(3,2)

def sum_recursive(arr)
  return arr[0] if arr.length == 1
  arr[0] + sum_recursive(arr[1..-1])
end
#p sum_recursive([1,2,3, 100])

def sum_iterative(arr)
  arr.reduce(:+)
end
#p sum_iterative([1,2,3, 100])

def exp(b, n)
  return 1 if n == 0
  b * exp(b, n-1)
end
 #exp(3,9)

def exp2(b, n)
  return 1 if n == 0
  if n.even?
    x = exp2(b, n/2)
    x*x
  else
    x = exp2(b, (n-1)/2)
    x*x*b
  end
end
#p exp2(2,3)



class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr << el.deep_dup
      else
        new_arr << el
      end
    end
    new_arr
  end
end



def fibonacci(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  prev_fib = fibonacci(n-1)
  prev_fib << prev_fib[-1] + prev_fib[-2]
end

#p fibonacci(7)


def permutations(array)
  return array if array.length == 1
  permutations_array = []
  array.each_with_index do |el, i|
    new_arr = array - [el]
    #permutations_array << [el] + permutations(new_arr)
    (permutations(new_arr)).each do |fragment|
      permutations_array << [el] + [fragment]
    end
  end
  permutations_array.map! {|el| el.flatten}
  permutations_array
end

#p permutations([1,2,3])




def bsearch(arr, target)
  middle = arr.length/2
  return middle if arr[middle] == target
  return nil if arr.empty?
  left_side = arr[0...middle]
  right_side = arr[middle+1..-1]
  if arr[middle] > target
    bsearch(left_side, target)
  elsif arr[middle] < target
    if bsearch(right_side, target).nil?
      return nil
    else
      left_side.length + 1 + bsearch(right_side, target)
    end
  else
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array

  def merge_sort
    return self if self.length <= 1
    middle = self.length/2
    left_side = self[0...middle]
    right_side = self[middle..-1]
    left_side.merge_sort
    right_side.merge_sort
    left_side + right_side
  end


end

p [1,2,6,3,5,9].merge_sort
