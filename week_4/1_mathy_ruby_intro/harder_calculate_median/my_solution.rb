# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
#Input: array of numbers (floats or integers) or strings 
# What is the output? (i.e. What should the code return?)
#Output: Median value, either a number (float or integer) or a string
# What are the steps needed to solve the problem?
#DEFINE a method, median
#SORT argument array in ascending order
#DETERMINE middle value of argument array using division
#SET middle value as variable, middle 
#AVERAGE the two middle values if the argument array is of even length 
#SET middle variable to middle value for odd arrays or averaged middle for even array 
#RETURN middle


# 2. Initial Solution

def median(array)
	middle = nil 
	array.sort!
	middle = array[array.length/2]
	middle = (middle + array[(array.length/2)- 1])/2.0 if array.length % 2 == 0
	middle
end




# 3. Refactored Solution
#Removed initialization of middle as nil
# SET middle index as variable to make more readible, since it's used. 

def median(array) 
	array.sort!
	mid_index = array.length/2
	middle = array[mid_index]
	middle = (middle + array[mid_index-1])/2.0 if array.length % 2 == 0
	middle
end



# 4. Reflection 
=begin
	This one was relatively straightforward and similar to the JS exercise. I found it easier than 
	the others in this release because it can only utilize a basic array method, sort. The rest
	is basic math and understanding array indexes

	This is the third one of these mathies I've done and I must reflect as I've done in the others. 
	The basic learning competencies are met, and I enjoy working with tests. 

	None of these are tedious and make good practice!	
=end