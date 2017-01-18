require "minitest/autorun"
require "compressor"

class TestCompressor < Minitest::Test  
  def test_compression_aaaa_in_4a
    compressible_string = Compressor.new("aaaa").convert_the_characters_in_the_compressed_text
    
    assert_equal "\x1C4\x1Ca", compressible_string
  end
  
  def test_compression_bbba_in_3ba
    compressible_string = Compressor.new("bbba").convert_the_characters_in_the_compressed_text
    
    assert_equal "\x1C3\x1Cba", compressible_string
  end
  
  def test_compression_bbbbb_aa_in_5b_2a
    compressible_string = Compressor.new("bbbbb aa").convert_the_characters_in_the_compressed_text
    
    assert_equal "\x1C5\x1Cb \x1C2\x1Ca", compressible_string
  end
end

