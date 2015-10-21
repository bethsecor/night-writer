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

end
