# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

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
#Intitial code doesn't need refactoring
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



# 4. Reflection 
=begin
	
	This is the last mathy problem for me to do. I basically have the same reflection as the last three. 
	I looked up how to sum and array and found the reduce method for an enumerable. It seems like a 
	very useful method. 

	I was going to use and array of letters and draw from them using an index but I don't know if it would 
	have improved the code at all, so I use the situation to test of a switch statement. 

	I've been working on the learning competencies and I hope I've improved with them. I did all four exercises in the 
	release because I thought they were good practice. 

	This was similar to the excercise on socrates though. 

	
=end
