require './lib/file_reader'
require 'pry'

class NightWriter
  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def encode_file_to_braille(to_file=ARGV[1])
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = @reader.read
    braille = encode_to_braille(plain)
    binding.pry

    File.open(to_file, 'w') do |file|
      file.puts braille
    end

    puts "Created '#{to_file}' containing #{braille.length} characters."
  end

  def encode_to_braille(input)
    "MAGIC!"
    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
  end
end

a_night_writer = NightWriter.new
a_night_writer.encode_file_to_braille

# puts ARGV.inspect
