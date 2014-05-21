# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: 
	# An initialized class, GuessingGame, should take an interger as an argument. 
# Output:
	#Guess method should output a symbol (:high, :low, or :correct)
	#Solved method should output a boolean (true or false)
# Steps:
	#DEFINE a class, GuessingGame 
    #DEFINE attribute reader of guessed property 
		#INITIALIZE with one argument, an iteger, answer 
			#RAISE Argument error if argument isn't an integer
			#SET answer as an instance property 
			#SET instance property, guessed, to nil
		#DEFINE guess method that takes one argument, an integer, posssible 
			#RAISE Argument error if argument isn't an integer
			#SET possible to guessed property
			#RETURN symbol, :correct, if possible matches answer property 
			#RETURN symbol, :high, if possible is greater than answer property
			#RETURN symbol, :low, if possible is less than answer property 
		#DEFINE boolean solved method that takes no arguments 
			#RETURN true if guess property equals @answer property 
			#RETURN false otherwise 

# 3. Initial Solution

class GuessingGame
  def initialize(answer)
  	unless answer.is_a? (Integer)
  		raise ArgumentError.new("Your player is expecting a number!")
  	end
    @answer = answer 
    @guess = nil
  end
  
  def guess(possible)
  	unless possible.is_a? (Integer)
  		raise ArgumentError.new("You have to guess a number!")
  	end
  	@guess = possible
  	return :correct if possible == @answer 
  	(possible > @answer) ? :high : :low
  end 

 def solved?
 	return true if @guess == @answer 
 	return false 
 end
end



# 4. Refactored Solution
#changed it so guessed prop and guess method had different names 

class GuessingGame
  attr_reader :guessed

  def initialize(answer)

  	raise ArgumentError.new("Your player is expecting a number!") unless answer.is_a? (Integer)
    
    @answer = answer 
    @guessed = nil

  end
  
  def guess(possible)
  
  	raise ArgumentError.new("You have to guess a number!") unless possible.is_a? (Integer) 
  	@guessed = possible

  	return :correct if possible == @answer 
  	(possible > @answer) ? :high : :low
  end 

 def solved?
 	return true if @guessed == @answer 
 	false 
 end
end


#Simple test guessing game. Works in terminal 
play = GuessingGame.new(37)
choice = nil

until play.solved? 
  puts "Here we go!" if play.guessed == nil
  puts "What's your guess?"
  choice = gets.chomp.to_i
  puts "That is #{play.guess(choice)}!"
end
puts "Winner!"




# 1. DRIVER TESTS GO BELOW THIS LINE

test = GuessingGame.new(42)

#TEST reader 

p test.guessed == nil

#TEST to see if game points you in correct direction 

p test.guess(10) == :low

p test.guess(130) == :high 


#TEST to make sure problem is solved 

p test.solved? == false

p test.guess(42) == :correct

p test.solved? == true 

#TEST to make sure only integers can be inputed as an argument 

begin
	GuessingGame.new([3])
rescue ArgumentError => e
	mes = e.message 
end

p mes == "Your player is expecting a number!"



# 5. Reflection 

=begin

This was a fun challenge from start to finish. I enjoyed using symbols and writing the driver code. 
The driver tests actually caught something the rspec didn't, a spelling error on my part. 

Having worked with exceptions on three challenges now, I've decided to play around with them a bit. I looked
into begin, rescue, ensure blocks and have learned a bunch. I plan to test them out with something in the near
  uture. 

I also learned a little more about ternary operators. It was a little tricky with symbols.  

I'm not sure about setting a guessed property at initialization, but having a saved property is the only
way to check for a solved game, so I'm guessing it's correct. As I wrote the code for the simple console game 
I saw an attribute reader would come in handy so I was able to insert one of those. It made me wonder if an 
attribute writer would work anywhere in here, but since we output symbols as well, I don't think it would be
worthwhile. It may even mess with the code. 

I didn't want to write the console game because I don't like writing a lot of print statements, but I 
decided to try to get it done in as little code as possible and it worked out well. 
Using the class methods within it saved on some space.

I'm pretty confident with the learning competencies and classes in general, and my familiarity with 
exceptions is growing. 

ALSO! RSPEC stopped working when I put in the console game but the driver code works fine, and it passed
all tests prior. 
	
=end
