# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

=begin
Total Method: 
Input is an array of numbers (string or floats)
Output is number	
	#SET variable, sum, to 0
	#ITERATE over array of numbers and add each element to sum
	#RETURN sum
=end

=begin
Sentence Maker Method: 
Input is an array of strings
Output is string formatted to a sentence
	#SET variable, sentence, to an empty string
	#CAPITALIZE first element in array.
	#ADD period to last element in array. 
	#ITERATE over array of strings and add each element to sentence with a space seperation
	#RETURN sentence
=end
# 2. Initial Solution

def total(array)
=begin
	Input: Array of integers or floats 
	Output: Integer or float 
=end
	#SET variable, sum, to 0
	#ITERATE over array of numbers and add each element to sum
	sum = 0
	array.each{|x| sum += x }
	#RETURN sum
	return sum
end

def sentence_maker(array)
=begin
	Input: Array of strings 
	Autput: String formatted to resemble sentence
=end
	#SET variable, sentence, to an empty string
	sentence = ""
	#CAPITALIZE first element in array.
	##ADD first element in array to sentence. 
	#ADD period to last element in array. 
	array[0].capitalize!
	sentence += array[0]
	array[array.length-1] += "."
	#ITERATE over array of strings from second element on and add each element to sentence with a space seperation
	array[1, length-1].each{ |x| sentence += " #{x}" }
	#RETURN sentence
	return sentence
end


# 3. Refactored Solution

def total(array)
=begin
	Input: Array of integers or floats 
	Output: Integer or float 
=end
	sum = 0
	array.each{|x| sum += x }
	return sum
end

def sentence_maker(array)
=begin
	Input: Array of strings 
	Autput: String formatted to resemble sentence
=end
	sentence = array[0].capitalize! 
	array[array.length-1] += "."
	array[1,array.length-1].each{ |x| sentence += " #{x}" }
	return sentence
end



# 4. Reflection
=begin
The major question I had, since this is my first challenge with ruby, was how to effectively go about 
distributing the work between pseudocode, code, and refactoring. I came up with this strategy: 

	1. Make an inital outline with pseudocode 
	2. Code with inline #pseudcode to make sure everything fits the outline 
	3. Remove unneccessary pseudocode from the refactored code 

I think this is the optimal strategy going forward for me if I have to pseudocode, code, and refactor on 
every exercise. 	

The "Test to solve" method was effective for me here. It's almost like reverse pseudocode. You have an 
output you want to achieve, and work torwards it until it is achieved. My tests failed because I had 
an extra space at the start of the sentence, so I thought how to solve that, and it helped in refactoring. 
	
I enjoyed this challenge, and I enjoy coding to test via the console. I still need to learn more about testing and
working the console effectively. 

=end

