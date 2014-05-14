# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input?
#Input: Fixnum
# What is the output? (i.e. What should the code return?)
#Output: String
# What are the steps needed to solve the problem?
#DEFINE method, separate_coma
#REDEFINE inputed number, as a string and reverse it, name it output
#RETURN reversed output if less than four characters 
#DETERMINE number of commas needed by examining the length of output
#INSERT comma at fourth index of output
#RETURN reverse output if length is fewer than seven characters
#FOR range of number of commas left in total commas:
	#INSERT comma at every fourth index 
#RETURN reversed output

# 2. Initial Solution
#Personal pseudo: stringify, reverse, insert commas at every 4th index so long as its between two numbers, reverse back

def separate_comma(number) #WORKS ON POSITIVE INTEGERS 
	output = number.to_s.reverse
	return number.to_s if output.length < 4 #no length prop for Fixnum
	commas = (output.length-1)/3 #Remove leading number from length to avoid front comma
	marker = 3 						
	output.insert(marker, ',')
	return output.reverse! if output.length < 7
	(2..commas).each{|x| marker += 4; output.insert(marker, ',') }
	output.reverse!
end


#RUBYISH INITIAL 
def separate_comma(number)
	negative = false
	if number.is_a? Float #is_a? checks for type
		number = number.to_s.split('.')
		decimal = number[1]
		number = number[0]
	end
	output = number.to_s #.to_s on string has no effect
	if number[0] == '-'
		number.slice!(0)  #string.slice!(index) removes at index 
		negative = true
	end
	# string.chars pushes characters to array
	# .each_slice(3).to_a collects elements of three into their own subarray
	# .collect(&:join) performs join on subarrays only, not entire array
	# .join(',') joins subarray with comma
	output = output.reverse.chars.each_slice(3).to_a.collect(&:join).join(',').reverse
	output.insert(0, '-') if negative == true
	if decimal 
		output << "." << decimal
	end
	output
end


# 3. Refactored Solution
#Refactored: Took out comments, simplified one line if statement

def separate_comma(number)
	negative = false
	if number.is_a? Float
		number = number.to_s.split('.')
		decimal = number[1]
		number = number[0]
	end
	output = number.to_s 
	if number[0] == '-'
		number.slice!(0)  
		negative = true
	end
	output = output.reverse.chars.each_slice(3).to_a.collect(&:join).join(',').reverse
	output.insert(0, '-') if negative == true
	output << "." << decimal if decimal 
	output
end

#TESTING CODE 

p separate_comma(-1000400005)
p separate_comma(-1)
p separate_comma(-0.3333333)
p separate_comma(0)
p separate_comma(0.2323)
p separate_comma(11)
p separate_comma(100000)
p separate_comma(10000000000000000000000)
p separate_comma(30232323232.3434332)


# 4. Reflection 

=begin

The first strategy I had was to think about the problem logically and implement a logical answer. 
It seemed pretty straightforward to me: Stringify, Reverse, insert commas, reverse back. 
I found the insert method for strings and figured out how to deal with getting the right index and making 
sure there was no leading comma. It was short and passed the tests, felt like good jerry-rigging,
but it didn't pass test for negatives and floating numbers 

I decided to see if I could refactor it into a more Ruby friendly code.
I knew this meant takind advatage of available methods. I realized that
producing an array of characters might offer more versatility since each character
would be its own element in addition to having an index. Found .chars method. 

From there, I looked for a method to collect in pairs of three the elements from the array 
and found the slice method, but it only worked over a given range, and the inputed number
could be of any length. Instead of trying to figure out the range of the input, 
I looked for a more specific method, and found .each_slice() which returns an enumerator object
 which I had to convert to an array with .to_a. This method was good because it works the entire array
 and, there was no inherent restriction on the size of the elements so the last could whatever if the number wasn't
 divisible by three. 

Then I had an array with elements of length three subelements (the last was 1-3
depending on the input number size). I thought .join(',') would be useful but it joined
the subelements as well, so I had somethng like 1,0,0,0,0 outputting!
I realized this was because .join converts each element to a string (probably) recursively, 
meaning that it compresses subelements into the string as well, so what I had to do was compress 
just the subelement first into strings and then join the elements they existed in into a string with a comma 
separator.  I could accomplish the first step with .collect() which,
according to the docs, works only ONCE with each element, not the whole array, 
and can take a block (in this case &:join) as an argument. 
After this .join(',') works as wanted. Reverse() that and it returned
a string with commas. Seems to output correctly and the tests pass. 



For dealing with negatives I just sliced off the first index, 
and added it back on again if it was negative. 

For dealing with floats I used the split method for strings, which
split the number at the decimal into two elements of an array. 
I set the first element as the whole number to operate on and stored 
the second as a variable, which I just con

This exercise was enjoyable. It was a more difficult problem that could be solved by a variey of 
approaches, so I decided to take my time with it, explore my options and more detailed testing, 
look at methods available, and write out my entire thought process. This is all part of my strategy to 
learn by going in depth on a couple problems a week. 

Working on a more Ruby-centric answer was fun. I can't say for sure its better (it did return
faster: 0.00126 sec vs 0.00134 sec), but it seems less wobbly, 
since I don't have to return case by case, and I'm not relying on storing a step number. But I still
enjoyed doing the first code. 


I learned about Enumerator objects because each.slice() was returning one, and I had to convert it to 
an array, but I'm still not exactly sure what this object is other than an identifier for enumerators and something 
with its method. 


Ideally, I'd like to set this up as a try/catch later on to deal with non-number inputs. 
	
=end