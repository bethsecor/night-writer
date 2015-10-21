# ruby ./test/night_writer_test.rb message.txt braille.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/night_writer'

class NightWriterTest < Minitest::Test
  def test_night_writer_exists
    a_night_writer = NightWriter.new
    assert a_night_writer.respond_to?(:encode_to_braille)
    assert a_night_writer.respond_to?(:encode_file_to_braille)
    assert a_night_writer.respond_to?(:split_text_to_chars)
    assert a_night_writer.respond_to?(:capital_letter?)
    assert a_night_writer.respond_to?(:is_a_number?)
    assert a_night_writer.respond_to?(:map_chars_to_braille)
    assert a_night_writer.respond_to?(:format_braille_to_lines)
    assert a_night_writer.respond_to?(:wrap_braille_lines_after_80_chars)
  end

  def test_split_text_to_chars
    text = "Hello,\nWorld!\n"
    a_night_writer = NightWriter.new
    assert_equal ["H", "e", "l", "l", "o", ",", " ", "W", "o", "r", "l", "d", "!"],
     a_night_writer.split_text_to_chars(text)
  end

  def test_capital_letter?
    a_night_writer = NightWriter.new
    assert a_night_writer.capital_letter?("A")
  end

  def test_is_a_number?
    a_night_writer = NightWriter.new
    char1 = "0"
    char2 = "a"
    char3 = "7"
    assert a_night_writer.is_a_number?(char1)
    refute a_night_writer.is_a_number?(char2)
    assert a_night_writer.is_a_number?(char3)
  end

  def test_map_chars_to_braille_simple_text
    text = "Hello,\nWorld!\n"
    a_night_writer = NightWriter.new
    assert_equal [[[".", "."], [".", "."], [".", "0"]],
                  [["0", "."], ["0", "0"], [".", "."]],
                  [["0", "."], [".", "0"], [".", "."]],
                  [["0", "."], ["0", "."], ["0", "."]],
                  [["0", "."], ["0", "."], ["0", "."]],
                  [["0", "."], [".", "0"], ["0", "."]],
                  [[".", "."], ["0", "."], [".", "."]],
                  [[".", "."], [".", "."], [".", "."]],
                  [[".", "."], [".", "."], [".", "0"]],
                  [[".", "0"], ["0", "0"], [".", "0"]],
                  [["0", "."], [".", "0"], ["0", "."]],
                  [["0", "."], ["0", "0"], ["0", "."]],
                  [["0", "."], ["0", "."], ["0", "."]],
                  [["0", "0"], [".", "0"], [".", "."]],
                  [[".", "."], ["0", "0"], ["0", "."]]], a_night_writer.map_chars_to_braille(text)
  end

  def test_map_chars_to_braille_one_number
    text = "780"
    a_night_writer = NightWriter.new
    assert_equal [[[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "0"], ["0", "0"], [".", "."]],
                  [["0", "."], ["0", "0"], [".", "."]],
                  [[".", "0"], ["0", "0"], [".", "."]]], a_night_writer.map_chars_to_braille(text)
  end

  def test_map_chars_to_braille_decimal_number
    text = "3.14"
    a_night_writer = NightWriter.new
    assert_equal [[[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "0"], [".", "."], [".", "."]],
                  [[".", "."], ["0", "0"], [".", "0"]],
                  [[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "."], [".", "."], [".", "."]],
                  [["0", "0"], [".", "0"], [".", "."]]], a_night_writer.map_chars_to_braille(text)
  end

  def test_map_chars_to_braille_simple_text_and_numbers
    text = "3.14 is PiE!"
    a_night_writer = NightWriter.new
    assert_equal [[[".", "0"], [".", "0"], ["0", "0"]],
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
                  [[".", "."], [".", "."], [".", "0"]],
                  [["0", "."], [".", "0"], [".", "."]],
                  [[".", "."], ["0", "0"], ["0", "."]]], a_night_writer.map_chars_to_braille(text)
  end

  def test_format_braille_to_lines
    text = "Hello,\nWorld!\n"
    a_night_writer = NightWriter.new
    assert_equal ["..0.0.0.0.0........00.0.0.00..",
                  "..00.00.0..00.....00.0000..000",
                  ".0....0.0.0......0.00.0.0...0."], a_night_writer.format_braille_to_lines(text)
  end

  def test_wrap_braille_lines_after_80_chars
    text = "Hello World! My name is Beth.\nHow are you?\nI go to seek a Great Perhaps. Smile, breathe, and go slowly.\n"
    a_night_writer = NightWriter.new
    assert_equal "..0.0.0.0.0......00.0.0.00......0000..000.000....0.0....0.0..00.......0.0..0..0.\n..00.00.0..0....00.0000..000.......0...0.....0..0.0.....0..0000000....00.000....\n.0....0.0.0....0.00.0.0...0....00.00..0...0.......0....0....0....0...0..0..0....\n0.0...000.0........0..000....00....00.0.0...0.....000.0.0..0....000.0.0.0.00.0..\n00.0...0.0..0.....0...00.0..00.0..0..0.0..........0000.0..00....0..00000..0.0.00\n0.....000.0000...0......0...0.0...0.....0........0..0.....0....00...0.....0.0..0\n.....000.00.0.....0.0.0.0..00.0.....0.0000..000....00.0..00.00..\n....0...0.0..00...0.00.0..0000.00......0.0..00.0..0.0..0000..000\n...00.0...0.........0.....0...........0.......0...0.0.0..00.00.0\n",
     a_night_writer.wrap_braille_lines_after_80_chars(text)
  end
end
