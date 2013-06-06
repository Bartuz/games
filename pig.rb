class PiglatinConverter
  # This is an example of a Ruby Constant
  VOWELS = ["a", "e", "i", "o", "u"]

  # This is how to define class method on PiglatinConverter and pass a parameter into the method
  def self.convert(word)

    # Check to see if word is nil or empty
    return word if word.nil? or word.empty?

    word = word.downcase

    # Convert word from a String to an Array
    letters = word.split("") # "cat" => ["c", "a", "t"]

    first_vowel_index = nil

    # This is how we loop over the letters array and
    # find the index of the first vowel within word
    letters.each_with_index do |letter, index|
      if VOWELS.include?(letter)
        first_vowel_index = index
        break
      end
    end

    consonants       = letters.join[0..first_vowel_index-1]
    after_vowel      = letters.join[first_vowel_index..-1]

    # Put the word back together
    return (after_vowel + consonants + "ay")

  end
end

word = gets.chomp

# Class method way

puts PiglatinConverter.convert(word)

# Instance method way

# game = PiglatinConverter.new
# game.convert(word)














