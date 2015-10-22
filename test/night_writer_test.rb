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

  def test_encode_to_braille_empty_text
    a_night_writer = NightWriter.new
    empty_text = ""
    assert_equal "", a_night_writer.encode_to_braille(empty_text)
  end

  def test_encode_to_braille_single_space
    a_night_writer = NightWriter.new
    text = " "
    assert_equal "..\n..\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_a
    a_night_writer = NightWriter.new
    text = "a"
    assert_equal "0.\n..\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_b
    a_night_writer = NightWriter.new
    text = "b"
    assert_equal "0.\n0.\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_c
    a_night_writer = NightWriter.new
    text = "c"
    assert_equal "00\n..\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_d
    a_night_writer = NightWriter.new
    text = "d"
    assert_equal "00\n.0\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_e
    a_night_writer = NightWriter.new
    text = "e"
    assert_equal "0.\n.0\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_f
    a_night_writer = NightWriter.new
    text = "f"
    assert_equal "00\n0.\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_g
    a_night_writer = NightWriter.new
    text = "g"
    assert_equal "00\n00\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_h
    a_night_writer = NightWriter.new
    text = "h"
    assert_equal "0.\n00\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_i
    a_night_writer = NightWriter.new
    text = "i"
    assert_equal ".0\n0.\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_j
    a_night_writer = NightWriter.new
    text = "j"
    assert_equal ".0\n00\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_k
    a_night_writer = NightWriter.new
    text = "k"
    assert_equal "0.\n..\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_l
    a_night_writer = NightWriter.new
    text = "l"
    assert_equal "0.\n0.\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_m
    a_night_writer = NightWriter.new
    text = "m"
    assert_equal "00\n..\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_n
    a_night_writer = NightWriter.new
    text = "n"
    assert_equal "00\n.0\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_o
    a_night_writer = NightWriter.new
    text = "o"
    assert_equal "0.\n.0\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_p
    a_night_writer = NightWriter.new
    text = "p"
    assert_equal "00\n0.\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_q
    a_night_writer = NightWriter.new
    text = "q"
    assert_equal "00\n00\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_r
    a_night_writer = NightWriter.new
    text = "r"
    assert_equal "0.\n00\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_s
    a_night_writer = NightWriter.new
    text = "s"
    assert_equal ".0\n0.\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_t
    a_night_writer = NightWriter.new
    text = "t"
    assert_equal ".0\n00\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_u
    a_night_writer = NightWriter.new
    text = "u"
    assert_equal "0.\n..\n00\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_v
    a_night_writer = NightWriter.new
    text = "v"
    assert_equal "0.\n0.\n00\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_w
    a_night_writer = NightWriter.new
    text = "w"
    assert_equal ".0\n00\n.0\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_x
    a_night_writer = NightWriter.new
    text = "x"
    assert_equal "00\n..\n00\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_y
    a_night_writer = NightWriter.new
    text = "y"
    assert_equal "00\n.0\n00\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_z
    a_night_writer = NightWriter.new
    text = "z"
    assert_equal "0.\n.0\n00\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_capital_A
    a_night_writer = NightWriter.new
    text = "A"
    assert_equal "..0.\n....\n.0..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_0
    a_night_writer = NightWriter.new
    text = "0"
    assert_equal ".0.0\n.000\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_1
    a_night_writer = NightWriter.new
    text = "1"
    assert_equal ".00.\n.0..\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_2
    a_night_writer = NightWriter.new
    text = "2"
    assert_equal ".00.\n.00.\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_3
    a_night_writer = NightWriter.new
    text = "3"
    assert_equal ".000\n.0..\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_4
    a_night_writer = NightWriter.new
    text = "4"
    assert_equal ".000\n.0.0\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_5
    a_night_writer = NightWriter.new
    text = "5"
    assert_equal ".00.\n.0.0\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_6
    a_night_writer = NightWriter.new
    text = "6"
    assert_equal ".000\n.00.\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_7
    a_night_writer = NightWriter.new
    text = "7"
    assert_equal ".000\n.000\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_8
    a_night_writer = NightWriter.new
    text = "8"
    assert_equal ".00.\n.000\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_9
    a_night_writer = NightWriter.new
    text = "9"
    assert_equal ".0.0\n.00.\n00..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_period
    a_night_writer = NightWriter.new
    text = "."
    assert_equal "..\n00\n.0\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_comma
    a_night_writer = NightWriter.new
    text = ","
    assert_equal "..\n0.\n..\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_exclamation_point
    a_night_writer = NightWriter.new
    text = "!"
    assert_equal "..\n00\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_question_mark
    a_night_writer = NightWriter.new
    text = "?"
    assert_equal "..\n0.\n00\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_apostrophe
    a_night_writer = NightWriter.new
    text = "'"
    assert_equal "..\n..\n0.\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_hyphen
    a_night_writer = NightWriter.new
    text = "-"
    assert_equal "..\n..\n00\n", a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_short_message
    text = "The number 3.14 is Pi!"
    a_night_writer = NightWriter.new
    assert_equal "...00.0...000.000.0.0....000...00.00...0.0....00.0..\n..0000.0...0....0..000...0..00.0...0..0.0.....0.0.00\n.00.......0.000.....0...00...000........0....00...0.\n",
      a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_long_message
    text = "Hello World! My name is Beth.\nHow are you?\nI go to seek a Great Perhaps. Smile, breathe, and go slowly.\n"
    a_night_writer = NightWriter.new
    assert_equal "..0.0.0.0.0......00.0.0.00......0000..000.000....0.0....0.0..00.......0.0..0..0.\n..00.00.0..0....00.0000..000.......0...0.....0..0.0.....0..0000000....00.000....\n.0....0.0.0....0.00.0.0...0....00.00..0...0.......0....0....0....0...0..0..0....\n0.0...000.0........0..000....00....00.0.0...0.....000.0.0..0....000.0.0.0.00.0..\n00.0...0.0..0.....0...00.0..00.0..0..0.0..........0000.0..00....0..00000..0.0.00\n0.....000.0000...0......0...0.0...0.....0........0..0.....0....00...0.....0.0..0\n.....000.00.0.....0.0.0.0..00.0.....0.0000..000....00.0..00.00..\n....0...0.0..00...0.00.0..0000.00......0.0..00.0..0.0..0000..000\n...00.0...0.........0.....0...........0.......0...0.0.0..00.00.0\n",
      a_night_writer.encode_to_braille(text)
  end

  def test_encode_to_braille_longer_message
    a_night_writer = NightWriter.new
    text = "To shut your eyes is to guess nothing of blindness. Beneath your world of skies and faces and buildings exists a rawer and older world, a place where surface planes disintegrate and sounds ribbon in shoals through the air."
    assert_equal "...00....00.0..0..000.0.0...0.000..0...0.0...00...000.0..0.0..000..00..00000..0.\n..00.0..0.00..00...0.0..00...0.0.00...0.0...00.0..00...00.0....0.000000..000...0\n.00.0...0...000...000.000.....00..0.....0...0.0.....00..0.0...0.0.0.....0.....0.\n00..0.0..00000000..0.0......0.0.000.0..00...000.0.0....00.0.0.00..0.00...00..00.\n0...0.0.0..0.0.0.00.0.00....0..0.0.0..0000...0.0..00..00.0000..0...00...0...0..0\n......0...0...0...0.0..0...0....0.....0.....000.000....00.0.0.....0.....0.0.....\n.0..0.0000..000.000..0..0.0000..0.0..00.00.00000.0..0.00.0.0.0.0..0...0.0..00.0.\n0......0.0..0......00......0.0..0...0.0..00..0000....0..0.0.000.......00..00.000\n0.....0.............0.....0.......00..0.....0...0.....00..0.0.0.......0....0..0.\n..0.0000..0.0.000.0....00.0.0.00....0...000.0.000....00.0.0.0....00.0.000.000...\n.....0.0...00..0.000..00.0000..00.......0.0......0..0000.000.0..0...000......0..\n....0.....0.0.....0....00.0.0...........0.0..........0....0.....0.000...........\n000.0.000..0..00.0.0.000.00.000.0..00...0.0000...00.0.0000.0..0..00.0.0.00...000\n0.0....0.00....00.0.0..000.00000..00.0.....0.0..0..0...0.00...000.0.0..0.0..0..0\n0.0...0...0.......0...0.0.....0...0.......0.....0.0.000...0...0.......0.0.....0.\n...00.0.0.0..0...00.0.0.0.000....00.0...0..00...\n..0.00.0..0.0...000000.0..0000..0000.0....0.0000\n..0...0...0.0...0...0.0.00......0...........0..0\n",
      a_night_writer.encode_to_braille(text)
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
    refute a_night_writer.capital_letter?("a")
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
    text_chars = ["H", "e", "l", "l", "o", ",", " ", "W", "o", "r", "l", "d", "!"]
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
                  [[".", "."], ["0", "0"], ["0", "."]]], a_night_writer.map_chars_to_braille(text_chars)
  end

  def test_map_chars_to_braille_one_number
    text_chars = ["7", "8", "0"]
    a_night_writer = NightWriter.new
    assert_equal [[[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "0"], ["0", "0"], [".", "."]],
                  [["0", "."], ["0", "0"], [".", "."]],
                  [[".", "0"], ["0", "0"], [".", "."]]], a_night_writer.map_chars_to_braille(text_chars)
  end

  def test_map_chars_to_braille_decimal_number
    text_chars = ["3", ".", "1", "4"]
    a_night_writer = NightWriter.new
    assert_equal [[[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "0"], [".", "."], [".", "."]],
                  [[".", "."], ["0", "0"], [".", "0"]],
                  [[".", "0"], [".", "0"], ["0", "0"]],
                  [["0", "."], [".", "."], [".", "."]],
                  [["0", "0"], [".", "0"], [".", "."]]], a_night_writer.map_chars_to_braille(text_chars)
  end

  def test_map_chars_to_braille_simple_text_and_numbers
    text_chars = ["3", ".", "1", "4", " ", "i", "s", " ", "P", "i", "E", "!"]
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
                  [[".", "."], ["0", "0"], ["0", "."]]], a_night_writer.map_chars_to_braille(text_chars)
  end

  def test_format_braille_to_lines
    braille_characters = [[[".", "."], [".", "."], [".", "0"]],
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
                          [[".", "."], ["0", "0"], ["0", "."]]]
    a_night_writer = NightWriter.new
    assert_equal ["..0.0.0.0.0........00.0.0.00..",
                  "..00.00.0..00.....00.0000..000",
                  ".0....0.0.0......0.00.0.0...0."], a_night_writer.format_braille_to_lines(braille_characters)
  end

  def test_wrap_braille_lines_after_80_chars
    braille_lines = ["..0.0.0.0.0......00.0.0.00......0000..000.000....0.0....0.0..00.......0.0..0..0.0.0...000.0........0..000....00....00.0.0...0.....000.0.0..0....000.0.0.0.00.0.......000.00.0.....0.0.0.0..00.0.....0.0000..000....00.0..00.00..",
                     "..00.00.0..0....00.0000..000.......0...0.....0..0.0.....0..0000000....00.000....00.0...0.0..0.....0...00.0..00.0..0..0.0..........0000.0..00....0..00000..0.0.00....0...0.0..00...0.00.0..0000.00......0.0..00.0..0.0..0000..000",
                     ".0....0.0.0....0.00.0.0...0....00.00..0...0.......0....0....0....0...0..0..0....0.....000.0000...0......0...0.0...0.....0........0..0.....0....00...0.....0.0..0...00.0...0.........0.....0...........0.......0...0.0.0..00.00.0"]
    a_night_writer = NightWriter.new
    assert_equal "..0.0.0.0.0......00.0.0.00......0000..000.000....0.0....0.0..00.......0.0..0..0.\n..00.00.0..0....00.0000..000.......0...0.....0..0.0.....0..0000000....00.000....\n.0....0.0.0....0.00.0.0...0....00.00..0...0.......0....0....0....0...0..0..0....\n0.0...000.0........0..000....00....00.0.0...0.....000.0.0..0....000.0.0.0.00.0..\n00.0...0.0..0.....0...00.0..00.0..0..0.0..........0000.0..00....0..00000..0.0.00\n0.....000.0000...0......0...0.0...0.....0........0..0.....0....00...0.....0.0..0\n.....000.00.0.....0.0.0.0..00.0.....0.0000..000....00.0..00.00..\n....0...0.0..00...0.00.0..0000.00......0.0..00.0..0.0..0000..000\n...00.0...0.........0.....0...........0.......0...0.0.0..00.00.0\n",
     a_night_writer.wrap_braille_lines_after_80_chars(braille_lines)
  end

  def test_encode_to_braille_long_message
    text = "Hello World! My name is Beth.\nHow are you?\nI go to seek a Great Perhaps. Smile, breathe, and go slowly.\n"
    a_night_writer = NightWriter.new
    assert_equal "..0.0.0.0.0......00.0.0.00......0000..000.000....0.0....0.0..00.......0.0..0..0.\n..00.00.0..0....00.0000..000.......0...0.....0..0.0.....0..0000000....00.000....\n.0....0.0.0....0.00.0.0...0....00.00..0...0.......0....0....0....0...0..0..0....\n0.0...000.0........0..000....00....00.0.0...0.....000.0.0..0....000.0.0.0.00.0..\n00.0...0.0..0.....0...00.0..00.0..0..0.0..........0000.0..00....0..00000..0.0.00\n0.....000.0000...0......0...0.0...0.....0........0..0.....0....00...0.....0.0..0\n.....000.00.0.....0.0.0.0..00.0.....0.0000..000....00.0..00.00..\n....0...0.0..00...0.00.0..0000.00......0.0..00.0..0.0..0000..000\n...00.0...0.........0.....0...........0.......0...0.0.0..00.00.0\n",
     a_night_writer.encode_to_braille(text)
  end

end
