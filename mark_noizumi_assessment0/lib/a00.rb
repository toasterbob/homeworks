# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  letters = ("a".."z").to_a
  cipher_string = ""
  str.chars do |ch|
    if ch >= "a" && ch <= "z"
      #pos = letters.find_index(ch)
      #pos += shift
      #pos = pos % 25
      #ch = letters(pos)
      shift.times do
        ch.next!
      end
      ch = ch[-1]
    end
    cipher_string += ch
  end
  cipher_string
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  if num >= 10 #if i had more time i could set this up better but this is the logic
    thousands = num/1000
    hundreds = num%1000/100
    tens = num%100/10
    ones = num%10
    num = thousands + hundreds + tens + ones
  end
  if num >= 10
    digital_root(num)
  else
    num
  end
end



# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  letters = ("a".."z").to_a
  sorted_string = ""
  if alphabet == nil
    sorted_string = str.split("").sort.join("")
  else
    alphabet.each do |ch|
      sorted_string
    end
  end
  sorted_string
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
end
