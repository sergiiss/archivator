require_relative 'archivator/compressor'
require_relative 'archivator/decompressor'

class Archivator
  def initialize
    @index_input_file  = 1
    @index_output_file = 2
  end

  def compress_or_decompress_text
    choose_compress_or_decompress
    get_the_text_from_a_file
    convert_text

    write_the_output_file
  end

  private

  attr_reader :text, :index_input_file, :index_output_file, :compressed_or_decompressed_text

  def choose_compress_or_decompress
    if ARGV[0] != '-u'
      @index_input_file = 0
      @index_output_file = 1
    end
  end

  def get_the_text_from_a_file
    @text = File.open(ARGV[index_input_file]) { |input_file| input_file.read }
  end

  def compressor
    @compressor ||= Compressor.new(text)
  end

  def decompressor
    @decompressor ||= Decompressor.new(text)
  end

  def convert_text
    @compressed_or_decompressed_text =
      if ARGV[0] != '-u'
        @compressed_or_decompressed_text = compressor.convert_the_characters_in_the_compressed_text
      else
        @compressed_or_decompressed_text = decompressor.convert_compressed_text_in_uncompressed
      end
  end

  def write_the_output_file
    File.open(ARGV[index_output_file], 'w') { |output_file| output_file.write compressed_or_decompressed_text }
  end
end
