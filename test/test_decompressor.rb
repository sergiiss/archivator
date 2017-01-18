require "minitest/autorun"
require "decompressor"

class TestDecompressor < Minitest::Test  
  def test_decompression_5b_2a_in_bbbbb_aa
    decompressible_line = Decompressor.new("\x1C5\x1Cb \x1C2\x1Ca").convert_compressed_text_in_uncompressed
    
    assert_equal "bbbbb aa", decompressible_line
  end
  
  def test_compression_3a_in_aaa
    decompressible_line = Decompressor.new("\x1C3\x1Ca").convert_compressed_text_in_uncompressed
    
    assert_equal "aaa", decompressible_line
  end
  
  def test_compression_6k_in_kkkkkk
    decompressible_line = Decompressor.new("\x1C6\x1Ck").convert_compressed_text_in_uncompressed
    
    assert_equal "kkkkkk", decompressible_line
  end
end

