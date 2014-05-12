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
#SET variable, middle, to nil
#SORT argument array in ascending order
#DETERMINE middle value of argument array using division 
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



# 4. Reflection 