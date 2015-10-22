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
end
