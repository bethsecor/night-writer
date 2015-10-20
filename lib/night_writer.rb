# ruby ./lib/night_writer_test.rb message.txt braille.txt

require './lib/file_reader'
require './lib/file_writer'
require './lib/alphabet_to_braille'
require 'pry'

class NightWriter
  attr_reader :file_reader
  attr_writer :file_writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def encode_file_to_braille #(to_file=ARGV[1])
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = @reader.read
    braille = encode_to_braille(plain)
    #binding.pry
    @writer.write(braille)

  end

  def encode_to_braille(input)
    # "MAGIC!"
    input * 3
    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
  end
end

a_night_writer = NightWriter.new
a_night_writer.encode_file_to_braille

# puts ARGV.inspect
