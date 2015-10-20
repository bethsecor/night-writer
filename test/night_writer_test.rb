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
  end
end
