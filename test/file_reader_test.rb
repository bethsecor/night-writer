# ruby ./test/file_reader_test.rb message.txt braille.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/file_reader'

class FileReaderTest < Minitest::Test
  def test_file_reader_reads
    reader = FileReader.new
    assert reader.respond_to?(:read)
  end
end
