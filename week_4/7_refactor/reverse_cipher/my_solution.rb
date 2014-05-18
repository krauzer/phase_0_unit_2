# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a #Creates and array with elements of letters as strings 
    spaces = ["@", "#", "$", "%", "^", "&", "*"] #Create array of special characters to signify what will mark spaces
    #shifts elements of alphabet to left by four; ties them to corresponding element of
    #original elements of alphabet in a subarray; converts said sub array to key-value pairs of a greater hash
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] 
    original_sentence = sentence.downcase #Place sentence to be encoded into a variable 
    encoded_sentence = [] #Create empty array to hold encoded sentence
    original_sentence.each_char do |element| #For each character in the original sentence
      if cipher.include?(element) #If the cipher hash includes the character
        encoded_sentence << cipher[element] #Push the cipher value into the encoded sentence array as element 
      elsif element == ' ' #Else if there is a space
        encoded_sentence << spaces.sample #Use a random element from the special character array 
      else 
        encoded_sentence << element #Else push unencoded value into encoded array
      end
     end
    
    encoded_sentence.join #Join all the elements in the encoded array and return as string 
end


# Questions:
# 1. What is the .to_a method doing?
    #.to_a converts the Range object into an array 

# 2. How does the rotate method work? What does it work on?
    # the rotate method takes the value passed as the index of the element to be shifted to the first 
      #index of the returned array. It works on an array and all elements follow the shift pattern. Can
      # be shifted from the last index as a negative value. 

# 3. What is `each_char` doing?
    # .each_char iterates over each character of the string it is passed on

# 4. What does `sample` do?
    # .sample picks a random element from the array and returns it if no value is passed as an argument 
    # If a value,x, is passed as an argument it returns an array containing ,x, elements, selected randomly. 
# 5. Are there any other methods you want to understand better?
    #From those used, I understand them, although I'm afraid I'll forget exactly how zip works. 

# 6. Does this code look better or worse than your refactored solution
    # of the original cipher code? What's better? What's worse?
    #It looks much better. The created hash is very nice. I still think it might be easier to use 
    #an array though. Also it doesn't alter the numbers. 

# 7. Is this good code? What makes it good? What makes it bad?
    #It looks like good code. It is easily readable. The objects created are clear and uncluttered. 
    #Pushing is the main method of storing. 


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
#The values representing spaces are different since they are randomly selected. 
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 

=begin
  I wonder if this could be altered for the better or if DBC is just testing our judgement. 
  "Could I Do Better?" is a question I should always ask myself, and I must remember this. I think this
  is the important idea to gather from this challenge. 

  There were some good methods in here that I hadn't used or seen. Sample, rotate, and zip were all I'm glad
  I now know about. I'm trying to think about how I could incorporate them into older excercises. 

  This puts our refactored code to shame. I like that such an improved solution (although this is 
  for encoding not decoding) was given after we completed the exercise. 
  It offers the chance to reflect. I think that I'm improving on the refactoring front. 
  
=end

