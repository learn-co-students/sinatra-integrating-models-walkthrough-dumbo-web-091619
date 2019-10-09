# Your TextAnalyzer model code will go here.

class TextAnalyzer
    attr_reader :text
   
    def initialize(text)
      @text = text.downcase
    end
   
    def count_of_words
      words = text.split(" ")
      words.count
    end
   
    def count_of_vowels
      text.scan(/[aeoui]/).count
    end
   
    def count_of_consonants
      text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
    end
   
    def most_used_letter
      s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
      arr = s1.split('') #arr of all letters present in text
      arr1 = arr.uniq #eliminates repeats
      arr2 = {}
   
      arr1.map do |c|
        #key is letter and value is it's count in 'uniqued' arr
        arr2[c] =  arr.count(c) 
      end
   
      biggest = { arr2.keys.first => arr2.values.first }
   
      arr2.each do |key, value|
        if value > biggest.values.first
          biggest = {}
          biggest[key] = value
        end
      end
   
      biggest
    end
  end
