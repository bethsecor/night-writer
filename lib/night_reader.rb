# ruby ./lib/night_reader.rb braille.txt message.txt
# ruby ./lib/night_reader.rb braille.txt message_decoded.txt

require './lib/file_reader'
require './lib/file_writer'
require './lib/alphabet_to_braille'
require 'pry'

class NightReader
  attr_reader :file_reader
  attr_writer :file_writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def decode_file_to_text
    braille = @reader.read
    binding.pry
    plain = decode_to_text(braille)
    @writer.write(plain)
  end

  def decode_to_text(input)
    braille_lines_to_three_lines(input)
  end

end

night_reader = NightReader.new
night_reader.decode_file_to_text
