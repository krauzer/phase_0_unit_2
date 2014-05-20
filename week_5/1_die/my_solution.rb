# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: 
	 #When new class is initialized as Die.new, an interger is passed as an argument. 
# Output:
	# the sides method returns the number of sides of the die, an interger
	# the roll method returns a random Integer between one and the number of sides on the die 
# Steps:
	#DEFINE the die class 
		#DEFINE the INITIALIZATION 
			#TAKE an argument, sides, that should be number
			#RAISE an ArgumentError if sides are initialized with a number less than one 
			#INITIALIZE sides that as a property, sides 
		#DEFINE the method, sides, that returns the sides property 
		#DEFINE the method, roll, which returns a random number, representing a side on the die


# 3. Initial Solution

class Die
  def initialize(sides)
  	unless sides > 1
  		raise ArgumentError.new("Die must have more than one side.")
  	end
    @sides = sides
  end
  
  def sides
    return @sides 
  end
  
  def roll
    return rand(@sides)+1
  end
end



# 4. Refactored Solution

class Die
  def initialize(sides)
  	unless sides >= 1
  		raise ArgumentError.new("Die must have at least one side.")
  	end
    @sides = sides
  end
  
  def sides
    @sides 
  end
  
  def roll
    rand(@sides)+1
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE

#CREATES object
tester_one = Die.new(10)

#tests for correct number of sides 
p tester_one.sides == 10

#makes sure roll is in correct range 
p (1..10).include?(tester_one.roll)


#test to make sure assertion is correct 
begin
	Die.new(-1)
rescue ArgumentError => e
	mes = e.message
end
p mes == "Die must have at least one side."



# 5. Reflection 
=begin
This was a pretty straigtforward class creation exercise, and I was able to accomplish it. I think
the main thing I learned from this was how to output method returns and the syntax of classes in Ruby. 
I wish the class and methods hadn't been predefined because initialization is the one thing I'm forgetting 
how to do, and that was provided for me. 

Working on the driver test code was fun, and I hope to learn how to do this better. I'm also hoping to work 
more with assertions. I'll have to look up some resources on that. 

It would have been good to allow for extra creative methods, maybe as an optional release.  

I'm looking forward to working with classes. 