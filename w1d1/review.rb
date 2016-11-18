
def factors(num)
  factors_arr = []
  check_num = 1
  while check_num <= num
    factors_arr << check_num if num % check_num == 0
    check_num += 1
  end
  factors_arr
end

class Array
  def bubble_sort!(&prc)
    sorted = false


    while !sorted
      i = 0
      flag = false
      while i < self.length - 1
        comparison = prc.call(self[i], self[i + 1])
        if comparison == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          flag = true
        end
        sorted = true if flag == false
        i += 1
      end
    end

    self
  end

  def bubble_sort(&prc)
    sorted = false
    duplicate_arr = self.dup

    while !sorted
      i = 0
      flag = false
      while i < duplicate_arr.length - 1
         comparison = prc.call(duplicate_arr[i], duplicate_arr[i + 1])
        if comparison == 1
          duplicate_arr[i], duplicate_arr[i + 1] = duplicate_arr[i + 1], duplicate_arr[i]
          flag = true
        end
        sorted = true if flag == false
        i += 1
      end
    end
    duplicate_arr
  end
end

def substrings(string)
  substring_arr = []
  i = 0
  while i <= string.length - 1
    x = 1
    while x <= string.length
      slice = string.slice(i,x)
      substring_arr << slice unless substring_arr.include?(slice)
      x += 1
    end
    i +=1
  end
  substring_arr
end

def subwords(word, dictionary)
  words_array = substrings(word)

  words_array = words_array.select { |el| dictionary.include?(el)}

  words_array
end





if __FILE__ == $PROGRAM_NAME
  dictionary = ["bears", "ear", "a", "army"]
  p subwords("erbearsweatmyajs", dictionary)

end
