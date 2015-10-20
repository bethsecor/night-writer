# ruby ./test/file_writer_test.rb message.txt braille.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/file_writer'

class FileWriterTest < Minitest::Test
  def test_file_reader_reads
    writer = FileWriter.new
    assert writer.respond_to?(:write)
  end
end
