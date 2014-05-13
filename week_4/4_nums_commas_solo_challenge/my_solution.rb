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

def separate_comma(number)
	output = number.to_s.reverse
	return number.to_s if output.length < 4
	len = output.length 
	commas = (len-1)/3
	marker = 3
	output.insert(marker, ',')
	return output.reverse! if output.length < 7
	(2..commas).each{|x| marker += 4; output.insert(marker, ',') }
	output.reverse!

end



# 3. Refactored Solution




# 4. Reflection 