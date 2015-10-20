require 'pry'

# alphabet_to_braille = {"a" => [["0","."],[".","."],[".","."]],
#   "b" => [["0","."],["0","."],[".","."]],
#   "c" => [["0","0"],[".","."],[".","."]],
#   "d" => [["0","0"],[".","0"],[".","."]],
#   "e" => [["0","."],[".","0"],[".","."]],
#   "f" => [["0","0"],["0","."],[".","."]],
#   "g" => [["0","0"],["0","0"],[".","."]],
#   "h" => [["0","."],["0","0"],[".","."]],
#   "i" => [[".","0"],["0","."],[".","."]],
#   "j" => [[".","0"],["0","0"],[".","."]],
#   "k" => [["0","."],[".","."],["0","."]],
#   "l" => [["0","."],["0","."],["0","."]],
#   "m" => [["0","0"],[".","."],["0","."]],
#   "n" => [["0","0"],[".","0"],["0","."]],
#   "o" => [["0","."],[".","0"],["0","."]],
#   "p" => [["0","0"],["0","."],["0","."]],
#   "q" => [["0","0"],["0","0"],["0","."]],
#   "r" => [["0","."],["0","0"],["0","."]],
#   "s" => [[".","0"],["0","."],["0","."]],
#   "t" => [[".","0"],["0","0"],["0","."]],
#   "u" => [["0","."],[".","."],["0","0"]],
#   "v" => [["0","."],["0","."],["0","0"]],
#   "w" => [[".","0"],["0","0"],[".","0"]],
#   "x" => [["0","0"],[".","."],["0","0"]],
#   "y" => [["0","0"],[".","0"],["0","0"]],
#   "z" => [["0","."],[".","0"],["0","0"]],
#   " " => [[".","."],[".","."],[".","."]],
#   "." => [[".","."],["0","0"],[".","0"]],
#   "," => [[".","."],["0","."],[".","."]],
#   "!" => [[".","."],["0","0"],["0","."]],
#   "?" => [[".","."],["0","."],["0","0"]],
#   "'" => [[".","."],[".","."],["0","."]],
#   "-" => [[".","."],[".","."],["0","0"]],
#   :cap => [[".","."],[".","."],[".","0"]]
# }

require './alphabet_to_braille'

puts ALPHABET_TO_BRAILLE.values.length
puts ALPHABET_TO_BRAILLE.values.uniq.length

text = "Hello World! My name is Beth. How are you?"
text_chars = text.split("")
puts text_chars.to_s
# text_chars.map { |char| alphabet_to_braille[char] }
text_braille = []
text_chars.each do |char|
  # binding.pry
  text_braille << ALPHABET_TO_BRAILLE[:cap] if char == char.upcase && ('a'...'z').to_a.include?(char.downcase)
  text_braille << ALPHABET_TO_BRAILLE[char.downcase]
end
# puts text_braille.to_s

# test = [[["a", "a"], ["b", "b"], ["c", "c"]],
#        [["a", "a"], ["b", "b"], ["c", "c"]],
#        [["a", "a"], ["b", "b"], ["c", "c"]]]
# puts test.to_s

line1 = []
line2 = []
line3 = []
text_braille.each do |braille_char|
  line1 << braille_char[0]
  line2 << braille_char[1]
  line3 << braille_char[2]
end


lines = [line1.flatten.join, line2.flatten.join, line3.flatten.join]
puts lines
puts lines[0].length



# every 80 chars, insert \n
# will not work, wraps each line
# ideas: split each line by 80 chars, then restructure
# append 3 line chunks together with \n
# lines.map! { |line| line.insert(80, "\n")}


# puts line1.flatten.to_s
# puts line2.flatten.to_s
# puts line3.flatten.to_s
#
# puts line1.flatten.join
# puts line2.flatten.join
# puts line3.flatten.join

# lines.each { |line| puts line }
