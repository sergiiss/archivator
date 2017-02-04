class Decompressor
  attr_reader :text
  
  def initialize(text)
    @text              = text
    
    @letters           = []
    @index             = 0
    @identifier        = 28.chr
    @decompressed_text = []
    @number_of_repeats = []
  end
  
  def convert_compressed_text_in_uncompressed
    split_the_input_text_into_characters
    receive_uncompressed_words
    convert_to_text
  end
  
  private
  
  attr_reader :letters, :index, :identifier, :decompressed_text,
              :number_of_repeats, :transition_to_next_letter
  
  def split_the_input_text_into_characters
    @letters = text.chars
  end
  
  def receive_uncompressed_words
    while index < letters.length
      if letters[index] == identifier
        convert_one_decompression
      else
        add_uncompressed_text
      end

      @index += 1
    end
  end
  
  def convert_one_decompression
    count_the_number_of_repetitions
    @decompressed_text.push(letters[transition_to_next_letter + 2].to_s * number_of_repeats.join.to_i)
    @index = transition_to_next_letter + 2
    @number_of_repeats = []
  end
  
  def count_the_number_of_repetitions
    while letters[index + 1] != identifier
      @number_of_repeats.push(letters[index + 1])
      @transition_to_next_letter = index + 1
          
      @index += 1
    end
  end
  
  def add_uncompressed_text
    decompressed_text.push(letters[index])
  end
  
  def convert_to_text
    @decompressed_text = decompressed_text.join
  end
end
