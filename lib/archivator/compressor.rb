class Compressor
  attr_reader :text
  
  def initialize(text)
    @text              = text
    
    @index             = 0
    @identifier        = 28.chr
    @number_of_letters = 1
    @letters           = []
    @compressed_text   = []
  end
  
  def convert_the_characters_in_the_compressed_text
    split_the_input_text_into_characters
    compress_repeated_characters
    convert_to_text
  end
  
  private
  
  attr_reader :index, :identifier, :number_of_letters, :letters, :compressed_text
  
  def split_the_input_text_into_characters
    @letters = text.chars
  end
  
  def compress_repeated_characters
    while index < letters.length
      if letters[index] != letters[index + 1] && number_of_letters == 1
        convert_not_recurring_characters
      elsif letters[index] == letters[index + 1]
        calculate_the_number_of_repeats_characters
      elsif letters[index] != letters[index + 1]
        convert_recurring_characters
      end

      @index += 1
    end
  end
  
  def convert_not_recurring_characters
    compressed_text.push(letters[index])
  end
  
  def calculate_the_number_of_repeats_characters
    @number_of_letters += 1
  end
  
  def convert_recurring_characters
    compressed_text.push(identifier + number_of_letters.to_s + identifier + letters[index].to_s)
    @number_of_letters = 1
  end
  
  def convert_to_text
    @compressed_text = compressed_text.join
  end
end
