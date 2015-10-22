# ruby ./test/night_reader_test.rb braille.txt message_decoded.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/night_reader'

class NightReaderTest < Minitest::Test
  def test_night_reader_exists
    a_night_reader = NightReader.new
    assert a_night_reader.respond_to?(:decode_file_to_text)
    assert a_night_reader.respond_to?(:decode_to_text)
    assert a_night_reader.respond_to?(:braille_lines_formatting)
    assert a_night_reader.respond_to?(:map_braille_chars_to_latin_alphabet)
    assert a_night_reader.respond_to?(:format_and_join_latin_characters)
  end

  def test_braille_lines_formatting
    a_night_reader = NightReader.new
    braille = "...00.0...000.000.0.0....000...00.00...0.0....00.0..\n..0000.0...0....0..000...0..00.0...0..0.0.....0.0.00\n.00.......0.000.....0...00...000........0....00...0.\n"
    assert_equal [[[".", "."], [".", "."], [".", "0"]],
                  [[".", "0"], ["0", "0"], ["0", "."]],
                  [["0", "."], ["0", "0"], [".", "."]],
                  [["0", "."], [".", "0"], [".", "."]],
                  [[".", "."], [".", "."], [".", "."]],
                  [["0", "0"], [".", "0"], ["0", "."]],
                  [["0", "."], [".", "."], ["0", "0"]],
                  [["0", "0"], [".", "."], ["0", "."]],
                  [["0", "."], ["0", "."], [".", "."]],
                  [["0", "."], [".", "0"], [".", "."]],
                  [["0", "."], ["0", "0"], ["0", "."]],
                  [[".", "."], [".", "."], [".", "."]],
                  [[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "0"], [".", "."], [".", "."]],
                  [[".", "."], ["0", "0"], [".", "0"]],
                  [[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "."], [".", "."], [".", "."]],
                  [["0", "0"], [".", "0"], [".", "."]],
                  [[".", "."], [".", "."], [".", "."]],
                  [[".", "0"], ["0", "."], [".", "."]],
                  [[".", "0"], ["0", "."], ["0", "."]],
                  [[".", "."], [".", "."], [".", "."]],
                  [[".", "."], [".", "."], [".", "0"]],
                  [["0", "0"], ["0", "."], ["0", "."]],
                  [[".", "0"], ["0", "."], [".", "."]],
                  [[".", "."], ["0", "0"], ["0", "."]]], a_night_reader.braille_lines_formatting(braille)
  end

  def test_map_braille_chars_to_latin_alphabet
    a_night_reader = NightReader.new
    braille_characters = [[[".", "."], [".", "."], [".", "0"]],
                          [[".", "0"], ["0", "0"], ["0", "."]],
                          [["0", "."], ["0", "0"], [".", "."]],
                          [["0", "."], [".", "0"], [".", "."]],
                          [[".", "."], [".", "."], [".", "."]],
                          [["0", "0"], [".", "0"], ["0", "."]],
                          [["0", "."], [".", "."], ["0", "0"]],
                          [["0", "0"], [".", "."], ["0", "."]],
                          [["0", "."], ["0", "."], [".", "."]],
                          [["0", "."], [".", "0"], [".", "."]],
                          [["0", "."], ["0", "0"], ["0", "."]],
                          [[".", "."], [".", "."], [".", "."]],
                          [[".", "0"], [".", "0"], ["0", "0"]],
                          [["0", "0"], [".", "."], [".", "."]],
                          [[".", "."], ["0", "0"], [".", "0"]],
                          [[".", "0"], [".", "0"], ["0", "0"]],
                          [["0", "."], [".", "."], [".", "."]],
                          [["0", "0"], [".", "0"], [".", "."]],
                          [[".", "."], [".", "."], [".", "."]],
                          [[".", "0"], ["0", "."], [".", "."]],
                          [[".", "0"], ["0", "."], ["0", "."]],
                          [[".", "."], [".", "."], [".", "."]],
                          [[".", "."], [".", "."], [".", "0"]],
                          [["0", "0"], ["0", "."], ["0", "."]],
                          [[".", "0"], ["0", "."], [".", "."]],
                          [[".", "."], ["0", "0"], ["0", "."]]]
    assert_equal [:capital, "t", "h", "e", " ", "n", "u", "m", "b", "e", "r", " ",
                  :number, "3", ".", :number, "1", "4", " ", "i", "s", " ", :capital, "p", "i", "!"],
                  a_night_reader.map_braille_chars_to_latin_alphabet(braille_characters)
  end

  def test_format_and_join_latin_characters
    a_night_reader = NightReader.new
    latin_text_characters = [:capital, "t", "h", "e", " ", "n", "u", "m", "b", "e", "r", " ",
                  :number, "3", ".", :number, "1", "4", " ", "i", "s", " ", :capital, "p", "i", "!"]
    assert_equal "The number 3.14 is Pi!", a_night_reader.format_and_join_latin_characters(latin_text_characters)
  end

  def test_decode_to_text
    a_night_reader = NightReader.new
    braille = "...00.0...000.000.0.0....000...00.00...0.0....00.0..\n..0000.0...0....0..000...0..00.0...0..0.0.....0.0.00\n.00.......0.000.....0...00...000........0....00...0.\n"
    assert_equal "The number 3.14 is Pi!", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_empty_braille
    a_night_reader = NightReader.new
    braille = ""
    assert_equal "", a_night_reader.decode_to_text(braille)
  end

end
