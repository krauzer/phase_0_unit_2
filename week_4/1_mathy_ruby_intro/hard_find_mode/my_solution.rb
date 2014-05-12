# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
	#Input: array of numbers (floats, integers) or strings. 
# What is the output? (i.e. What should the code return?)
	#Output: array of number/s consisting of the most frequent elements in the input array
# What are the steps needed to solve the problem?
	#INIT a new hash, vals, that is empty
	#INIT a new empty array, mode_vals, to be returned
	#ITERATE over inputed array: 
		#ADD element as key IF not in vals and SET value to 1
		#INCREMENT value if element alreay a key
	#PUSH keys with highest values into mode_vals array:
		#INSERT values in array
		#RETURN max value from that array
		#PUSH keys with max value in mode_vals
	#RETURN mode_vals

# 2. Initial Solution
def mode(array)
	vals = {}
	mode_vals = []
	array.each {|x|
		if vals.include? x 
			vals[x] += 1
		else
			vals[x] = 1
		end
	}
	#hash.values puts values in array. array.max returns the max!
	max = vals.values.max
	vals.each {|key,value| 
		mode_vals.push(key) if value == max
	}
	mode_vals
end



# 3. Refactored Solution



# 4. Reflection 
=begin
	 

	I've rethought my pseudocoding strategy because the page gets less readable with so many comments. Also, I think DBC wants us to commit at 
	each stage, so I shouldn't do all of them at the same time. 

	
=end