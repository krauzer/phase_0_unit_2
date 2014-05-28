# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: A string containing Intergers and Special characters 
# Output: An Integer 
# Steps:
	#DEFINE RPNCalculator class
		#initialize said class
		#DEFINE evaluate method
			#SET empty answer array
			#SPLIT input into array
			#ITERATE over input array 
			#CHECK for operator string 
				#IF operator string found
					#REDUCE last two values in answer array by operator type
					#SET reduction to array at last index
					#DELETE 2nd to last value in answer array
				#IF integer
					#PUSH integer into answer array
			#RETURN value at first index of answer array which should be fully reduced value


# 3. Initial Solution

class RPNCalculator
  def initialize
  end

  def evaluate(input)
  	answer = []
  	input = input.split(" ")
  	input.each {|value| 
  		if value == "+"
  				answer[-1] = answer[-2,2].reduce(:+)
  				answer.delete_at(-2)
  		elsif value == "-"
  				answer[-1] = answer[-2,2].reduce(:-)
  				answer.delete_at(-2)
  		elsif value == "*"
  				answer[-1] = answer[-2,2].reduce(:*)
  				answer.delete_at(-2)
  		else
  			answer << value.to_i
  		end
  		
  	}
  	answer[0]
  end 
end





# 4. Refactored Solution

class RPNCalculator
  def initialize
  end

  def evaluate(input)
  	answer = []
  	input = input.split(" ")
  	input.each {|value| 
  		if value == "+"
  				answer[-1] = answer[-2,2].reduce(:+)
  				answer.delete_at(-2)
  		elsif value == "-"
  				answer[-1] = answer[-2,2].reduce(:-)
  				answer.delete_at(-2)
  		elsif value == "*"
  				answer[-1] = answer[-2,2].reduce(:*)
  				answer.delete_at(-2)
  		else
  			answer << value.to_i
  		end
  		
  	}
  	answer[0]
  end 
end






# 1. DRIVER TESTS GO BELOW THIS LINE
calc = RPNCalculator.new

p calc.evaluate('1 2 +') == 3   # => 3
p calc.evaluate('2 5 *') == 10 # => 10
p calc.evaluate('50 20 -') == 30# => 30
p calc.evaluate('70 10 4 + 5 * -') == 0 # => 0





# 5. Reflection 

=begin
	
This was difficult, but I knew i had to work in the context of an array. This put my array methods knowledge
to the test and exposed my frustration at not knowing how to properly manipulate arrays. I feel like ruby's methods 
are not optimal on this and I miss simple array copying and splicing, but it's something I'll have to get used to. 

I'm going to spend more time learning how to work arrays in ruby. I know that is crucial for a lot of code. 


My strategy was to reduce what is done and work from there. I knew there was some logic behind the problem. I originally was 
going to put everything in working order but the operators (-,+,*) were a problem because I couldn't figure out how to 
translate them out of string format, so i had to use three if statements at the very least. Might as well 
try to reduce the array down in each statement. Then there was the repetitive delete_at statement, but I don't think 
separating it out would have been cleaner, since the else statement handles all non-operators and has no delete. 

Overall, I think the difficulty for this problem was dealing with the nature of strings, integers, and those operators which 
are neither. 

I don't think I fulfilled the learning competencies because I didn't break the problem down. I do like the array learning though. 

This problem was enjoyable once I decided on a plan. 
	
=end
