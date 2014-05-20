# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: 
	 #When new class is initialized as Die.new, an array of string letters is passed as an argument. 
# Output:
	# the sides method returns the number of sides of the die, an interger
	# the roll method returns a, string, from a random element of the labels array  
# Steps:
	#DEFINE the die class 
		#DEFINE the INITIALIZATION 
			#TAKE an argument, labels, that should be an non-empty array of strings 
			#RAISE an ArgumentError if labels  are initialized with an empty array
			#INITIALIZE labels as a property, labels
		#DEFINE the method, sides, that returns the length of the labels array
		#DEFINE the method, roll, which returns an random element of the labels array, representing one
		#labeled side of the die



# 3. Initial Solution

class Die
  def initialize(labels)
  	if labels.empty? 
  		raise ArgumentError.new("Need a die with defined sides.")
  	end
  	@labels = labels 
  end

  def sides
  	return @labels.length
  end

  def roll
  	return @labels[rand(@labels.length)]
  end
end



# 4. Refactored Solution

class Die
  def initialize(labels)

  	raise ArgumentError.new("Need a die with defined sides.") if labels.empty? 
  	@labels = labels 
  end

  def sides
  	 @labels.length
  end

  def roll
  	@labels[rand(@labels.length)]
  end
end





# 1. DRIVER TESTS GO BELOW THIS LINE
tester = Die.new(["A","B","C","D","E"])

#TEST to see if sides are correct number
p tester.sides == 5

#TEST to see roll produces result in range 
p ("A".."E").include?(tester.roll)

begin
	Die.new([])
rescue ArgumentError => e
	mes = e.message 
end

p mes == "Need a die with defined sides."






# 5. Reflection 

=begin

This challenge seemed a lot like the last one, only a little more complicated. I am confident that 
I can impliment classes like this because the ruby code is simple and straightforward. I guess the point of 
this was to show how an array can be a property. I would have liked to see a Die class where you can either 
choose to have numerical sides or one with letters. Maybe such challenges will come forward in the future. 

The driver code was much the same, but I'd like to impliment more complicated driver code in the future. 
Not code that test for equality once, but code that runs a larger number of times to make sure one test 
isn't an anomaly. 	

The challenge wan't tedious, and it has helped to improve my understanding of syntax. 

=end
