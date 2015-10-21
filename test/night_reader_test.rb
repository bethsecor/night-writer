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
  end
end
