# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
#Input: an array of number grades
# What is the output? (i.e. What should the code return?)
#Output: a string representing the letter value for the average of inputed grades
# What are the steps needed to solve the problem?
#DEFINE method, get_grade
#SET variable, average, to sum of array elements divided by length of array
#SET switch statement to convert average from a number to equivalent letter grade
#RETURN from switch statement




# 2. Initial Solution
def get_grade(array)
	average = array.reduce(:+)/array.length
	case average
		when 90...100
			"A"
		when 80..90
			"B"
		when 70..80
			"C"
		when 60..70
			"D"
		when 0..60
			"F"
		else
			"ERROR"
	end
end



# 3. Refactored Solution



# 4. Reflection 

