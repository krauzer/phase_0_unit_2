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
	#INIT a new array, mode_vals, to be returned
	#ITERATE over array argument: 
		#ADD element as key IF not in vals and SET value to 1
		#INCREMENT value if element alreay a key
	#PUSH keys with highest values into mode_vals array:
		#INSERT values in array
		#RETURN max value from that array as max variable
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
# For this specific code, I can only think of renaming the iterable value to element
# I'm sure there is a better way to do it with more refined methods
# but that could mean rewritting the entire thing. 
# I also thought about condensing the if/else statement, but that would make it less readable imo.
def mode(array)
	vals = {}
	mode_vals = []
	array.each {|element|
		if vals.include? element 
			vals[element] += 1
		else
			vals[element] = 1
		end
	}
	max = vals.values.max
	vals.each {|key,value| 
		mode_vals.push(key) if value == max
	}
	mode_vals
end


# 4. Reflection 
=begin
	 

	I've rethought my pseudocoding strategy because the page gets less readable with so many comments. Also, I think DBC wants us to commit at 
	each stage, so I shouldn't do all of them at the same time. 

	I don't think I like all this "sugar" in ruby. It makes it more readable, but I liked the dependable logic 
	of a written out language. 

	My strategy was to go step by step and see if I could improve anywhere. I learned about the hash.values method 
	which returns an array, and I just method chained max to get the max value. 
	I also pushed rather than using the << operator because I like practicing with array methods and 
	push is a classic. 
	
	I tried to refactor but could find no real improvements. I stopped explicitly returning because I hear it's bad form!

	This is good learning for picking up Ruby techniques. I have done problems like this in pyhton somewhat, but all the 
	sugaring for ruby makes it very different. 

	I've been using the ruby docs to learn more methods. 
	
=end