# ruby ./lib/night_writer_test.rb message.txt braille.txt

require './lib/file_reader'
require './lib/file_writer'
require './lib/alphabet_to_braille'
require 'pry'

class NightWriter
  attr_reader :file_reader
  attr_writer :file_writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def encode_file_to_braille
    plain = @reader.read
    braille = encode_to_braille(plain)
    @writer.write(braille)
  end

  def encode_to_braille(input)
    wrap_braille_lines_after_80_chars(input)
  end

  def split_text_to_chars(text)
    text.chomp.gsub("\n", " ").split("")
  end

  def capital_letter?(char)
    char == char.upcase && ('a'...'z').to_a.include?(char.downcase)
  end

  def map_chars_to_braille(text)
    text_chars = split_text_to_chars(text)
    text_braille = []
    text_chars.each do |char|
      text_braille << ALPHABET_TO_BRAILLE[:capital] if capital_letter?(char)
      text_braille << ALPHABET_TO_BRAILLE[char.downcase]
    end
    text_braille
  end

  def format_braille_to_lines(text)
    braille = map_chars_to_braille(text)
    line1 = []
    line2 = []
    line3 = []
    braille.each do |braille_char|
      line1 << braille_char[0]
      line2 << braille_char[1]
      line3 << braille_char[2]
    end
    lines = [line1.flatten.join, line2.flatten.join, line3.flatten.join]
  end

  def wrap_braille_lines_after_80_chars(text)
    lines = format_braille_to_lines(text)

    lines_split_80 = lines.map {|line| line.scan(/.{1,80}/m)}

    braille_lines_for_print = []
    0.upto(lines_split_80[0].length-1) do |i|
      braille_lines_for_print << lines_split_80[0][i] + "\n" + lines_split_80[1][i] + "\n" + lines_split_80[2][i] + "\n"
    end
    braille_lines_for_print.join
  end
end

night_writer = NightWriter.new
night_writer.encode_file_to_braille
