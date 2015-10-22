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

  def test_decode_to_text_empty_braille
    a_night_reader = NightReader.new
    braille = ""
    assert_equal "", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_single_space
    a_night_reader = NightReader.new
    braille = "..\n..\n..\n"
    assert_equal " ", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_a
    a_night_reader = NightReader.new
    braille = "0.\n..\n..\n"
    assert_equal "a", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_b
    a_night_reader = NightReader.new
    braille = "0.\n0.\n..\n"
    assert_equal "b", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_c
    a_night_reader = NightReader.new
    braille = "00\n..\n..\n"
    assert_equal "c", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_d
    a_night_reader = NightReader.new
    braille = "00\n.0\n..\n"
    assert_equal "d", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_e
    a_night_reader = NightReader.new
    braille = "0.\n.0\n..\n"
    assert_equal "e", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_f
    a_night_reader = NightReader.new
    braille = "00\n0.\n..\n"
    assert_equal "f", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_g
    a_night_reader = NightReader.new
    braille = "00\n00\n..\n"
    assert_equal "g", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_h
    a_night_reader = NightReader.new
    braille = "0.\n00\n..\n"
    assert_equal "h", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_i
    a_night_reader = NightReader.new
    braille = ".0\n0.\n..\n"
    assert_equal "i", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_j
    a_night_reader = NightReader.new
    braille = ".0\n00\n..\n"
    assert_equal "j", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_k
    a_night_reader = NightReader.new
    braille = "0.\n..\n0.\n"
    assert_equal "k", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_l
    a_night_reader = NightReader.new
    braille = "0.\n0.\n0.\n"
    assert_equal "l", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_m
    a_night_reader = NightReader.new
    braille = "00\n..\n0.\n"
    assert_equal "m", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_n
    a_night_reader = NightReader.new
    braille = "00\n.0\n0.\n"
    assert_equal "n", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_o
    a_night_reader = NightReader.new
    braille = "0.\n.0\n0.\n"
    assert_equal "o", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_p
    a_night_reader = NightReader.new
    braille = "00\n0.\n0.\n"
    assert_equal "p", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_q
    a_night_reader = NightReader.new
    braille = "00\n00\n0.\n"
    assert_equal "q", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_r
    a_night_reader = NightReader.new
    braille = "0.\n00\n0.\n"
    assert_equal "r", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_s
    a_night_reader = NightReader.new
    braille = ".0\n0.\n0.\n"
    assert_equal "s", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_t
    a_night_reader = NightReader.new
    braille = ".0\n00\n0.\n"
    assert_equal "t", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_u
    a_night_reader = NightReader.new
    braille = "0.\n..\n00\n"
    assert_equal "u", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_v
    a_night_reader = NightReader.new
    braille = "0.\n0.\n00\n"
    assert_equal "v", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_w
    a_night_reader = NightReader.new
    braille = ".0\n00\n.0\n"
    assert_equal "w", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_x
    a_night_reader = NightReader.new
    braille = "00\n..\n00\n"
    assert_equal "x", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_y
    a_night_reader = NightReader.new
    braille = "00\n.0\n00\n"
    assert_equal "y", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_z
    a_night_reader = NightReader.new
    braille = "0.\n.0\n00\n"
    assert_equal "z", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_capital_A
    a_night_reader = NightReader.new
    braille = "..0.\n....\n.0..\n"
    assert_equal "A", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_0
    a_night_reader = NightReader.new
    braille = ".0.0\n.000\n00..\n"
    assert_equal "0", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_1
    a_night_reader = NightReader.new
    braille = ".00.\n.0..\n00..\n"
    assert_equal "1", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_2
    a_night_reader = NightReader.new
    braille = ".00.\n.00.\n00..\n"
    assert_equal "2", a_night_reader.decode_to_text(braille)
  end
  def test_decode_to_text_3
    a_night_reader = NightReader.new
    braille = ".000\n.0..\n00..\n"
    assert_equal "3", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_4
    a_night_reader = NightReader.new
    braille = ".000\n.0.0\n00..\n"
    assert_equal "4", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_5
    a_night_reader = NightReader.new
    braille = ".00.\n.0.0\n00..\n"
    assert_equal "5", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_6
    a_night_reader = NightReader.new
    braille = ".000\n.00.\n00..\n"
    assert_equal "6", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_7
    a_night_reader = NightReader.new
    braille = ".000\n.000\n00..\n"
    assert_equal "7", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_8
    a_night_reader = NightReader.new
    braille = ".00.\n.000\n00..\n"
    assert_equal "8", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_9
    a_night_reader = NightReader.new
    braille = ".0.0\n.00.\n00..\n"
    assert_equal "9", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_period
    a_night_reader = NightReader.new
    braille = "..\n00\n.0\n"
    assert_equal ".", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_comma
    a_night_reader = NightReader.new
    braille = "..\n0.\n..\n"
    assert_equal ",", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_exclamation_point
    a_night_reader = NightReader.new
    braille = "..\n00\n0.\n"
    assert_equal "!", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_question_mark
    a_night_reader = NightReader.new
    braille = "..\n0.\n00\n"
    assert_equal "?", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_apostrophe
    a_night_reader = NightReader.new
    braille = "..\n..\n0.\n"
    assert_equal "'", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_hyphen
    a_night_reader = NightReader.new
    braille = "..\n..\n00\n"
    assert_equal "-", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_short_message
    a_night_reader = NightReader.new
    braille = "...00.0...000.000.0.0....000...00.00...0.0....00.0..\n..0000.0...0....0..000...0..00.0...0..0.0.....0.0.00\n.00.......0.000.....0...00...000........0....00...0.\n"
    assert_equal "The number 3.14 is Pi!", a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_long_message
    a_night_reader = NightReader.new
    braille = "..0.0.0.0.0......00.0.0.00......0000..000.000....0.0....0.0..00.......0.0..0..0.\n..00.00.0..0....00.0000..000.......0...0.....0..0.0.....0..0000000....00.000....\n.0....0.0.0....0.00.0.0...0....00.00..0...0.......0....0....0....0...0..0..0....\n0.0...000.0........0..000....00....00.0.0...0.....000.0.0..0....000.0.0.0.00.0..\n00.0...0.0..0.....0...00.0..00.0..0..0.0..........0000.0..00....0..00000..0.0.00\n0.....000.0000...0......0...0.0...0.....0........0..0.....0....00...0.....0.0..0\n.....000.00.0.....0.0.0.0..00.0.....0.0000..000....00.0..00.00..\n....0...0.0..00...0.00.0..0000.00......0.0..00.0..0.0..0000..000\n...00.0...0.........0.....0...........0.......0...0.0.0..00.00.0\n"
    assert_equal "Hello World! My name is Beth. How are you? I go to seek a Great Perhaps. Smile, breathe, and go slowly.",
      a_night_reader.decode_to_text(braille)
  end

  def test_decode_to_text_longer_message
    a_night_reader = NightReader.new
    braille = "...00....00.0..0..000.0.0...0.000..0...0.0...00...000.0..0.0..000..00..00000..0.\n..00.0..0.00..00...0.0..00...0.0.00...0.0...00.0..00...00.0....0.000000..000...0\n.00.0...0...000...000.000.....00..0.....0...0.0.....00..0.0...0.0.0.....0.....0.\n00..0.0..00000000..0.0......0.0.000.0..00...000.0.0....00.0.0.00..0.00...00..00.\n0...0.0.0..0.0.0.00.0.00....0..0.0.0..0000...0.0..00..00.0000..0...00...0...0..0\n......0...0...0...0.0..0...0....0.....0.....000.000....00.0.0.....0.....0.0.....\n.0..0.0000..000.000..0..0.0000..0.0..00.00.00000.0..0.00.0.0.0.0..0...0.0..00.0.\n0......0.0..0......00......0.0..0...0.0..00..0000....0..0.0.000.......00..00.000\n0.....0.............0.....0.......00..0.....0...0.....00..0.0.0.......0....0..0.\n..0.0000..0.0.000.0....00.0.0.00....0...000.0.000....00.0.0.0....00.0.000.000...\n.....0.0...00..0.000..00.0000..00.......0.0......0..0000.000.0..0...000......0..\n....0.....0.0.....0....00.0.0...........0.0..........0....0.....0.000...........\n000.0.000..0..00.0.0.000.00.000.0..00...0.0000...00.0.0000.0..0..00.0.0.00...000\n0.0....0.00....00.0.0..000.00000..00.0.....0.0..0..0...0.00...000.0.0..0.0..0..0\n0.0...0...0.......0...0.0.....0...0.......0.....0.0.000...0...0.......0.0.....0.\n...00.0.0.0..0...00.0.0.0.000....00.0...0..00...\n..0.00.0..0.0...000000.0..0000..0000.0....0.0000\n..0...0...0.0...0...0.0.00......0...........0..0\n"
    assert_equal "To shut your eyes is to guess nothing of blindness. Beneath your world of skies and faces and buildings exists a rawer and older world, a place where surface planes disintegrate and sounds ribbon in shoals through the air.",
      a_night_reader.decode_to_text(braille)
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

end
