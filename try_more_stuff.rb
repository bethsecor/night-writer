require 'pry'
require './alphabet_to_braille'

# braille = "..0.0.0.0.0......00.0.0.00......0000..000.000....0.0....0.0..00.......0.0..0..0.\n..00.00.0..0....00.0000..000.......0...0.....0..0.0.....0..0000000....00.000....\n.0....0.0.0....0.00.0.0...0....00.00..0...0.......0....0....0....0...0..0..0....\n0.0...000.0........0..000....00....00.0.0...0.....000.0.0..0....000.0.0.0.00.0..\n00.0...0.0..0.....0...00.0..00.0..0..0.0..........0000.0..00....0..00000..0.0.00\n0.....000.0000...0......0...0.0...0.....0........0..0.....0....00...0.....0.0..0\n.....000.00.0.....0.0.0.0..00.0.....0.0000..000....00.0..00.00..\n....0...0.0..00...0.00.0..0000.00......0.0..00.0..0.0..0000..000\n...00.0...0.........0.....0...........0.......0...0.0.0..00.00.0\n"
braille = "...00.0...000.000.0.0....000...00.00...0.0....00.0..\n..0000.0...0....0..000...0..00.0...0..0.0.....0.0.00\n.00.......0.000.....0...00...000........0....00...0.\n"
lines_split_80 = braille.split("\n")
lines_split_80.length
line1_indices = (0...lines_split_80.length).to_a.select { |i| i % 3 == 0 }
line2_indices = line1_indices.map { |i| i + 1 }
line3_indices = line1_indices.map { |i| i + 2 }

line1 = line1_indices.map{ |index| lines_split_80[index] }.join
line2 = line2_indices.map{ |index| lines_split_80[index] }.join
line3 = line3_indices.map{ |index| lines_split_80[index] }.join

line1_chars = line1.split("")
line2_chars = line2.split("")
line3_chars = line3.split("")

braille_chars = []
loop do
  braille_chars << [line1_chars.shift(2), line2_chars.shift(2), line3_chars.shift(2)]
  break if line3_chars.empty?
end
# puts braille_chars.to_s

braille_text = []
number_follows = false
braille_chars.each do |braille_char|
  number_follows = true if braille_char == [[".", "0"], [".", "0"], ["0", "0"]]
  number_follows = false if [[[".", "."], [".", "."], [".", "."]],[[".", "."], ["0", "0"], [".", "0"]],[[".", "."], ["0", "."], [".", "."]]].include?(braille_char)
    if number_follows
      braille_text << BRAILLE_TO_NUMBERS[braille_char]
    else
      braille_text << BRAILLE_TO_ALPHABET[braille_char]
    end
end

puts braille_text.to_s
braille_text.delete(:number)

# capitalize
loop do
  i = braille_text.index(:capital)
  braille_text[i+1] = braille_text[i+1].capitalize
  braille_text.delete_at(i)
  break if !braille_text.include?(:capital)
end
# join!
puts braille_text.join
