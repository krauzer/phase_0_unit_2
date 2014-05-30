# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge [by myself].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode
#DEFINE class, PezDispenser
	#INITIALIZE PezDispenser 
		#SET single input parameter as an array of flavors, called flavors 
		#SET flavors array to flavors attribute 
	#DEFINE pez_count methods that counts pez
		#RETURN length of flavors array 
	#DEFINE get_pez method that allows you to remove piece of pez
		#RETURN first element of flavors propery; remove from flavors 
	#DEFINE a add_pez method that allows you to add pez piece 
		#PUSH flavor to end of (bottom) of flavors prop
	#DEFINE see_all_pez method that allows you to see pez flavor order
		#Print out flavors and order 




# 3. Initial Solution

class PezDispenser
	attr_reader :flavors
 
	def initialize(flavors)
		@flavors = flavors.clone
	end

	def pez_count
		flavors.length
	end

	def get_pez
		@flavors.shift

	end

	def add_pez(flavor)
		@flavors << flavor
	end

	def see_all_pez
		amount = flavors.length 
		(1..amount).each{ |n| p "Flavor #{n}: #{@flavors[n-1]}" 

		}
	end
 
end
 


# 4. Refactored Solution
#Can't see much room for refactoring; added some assertions 

class PezDispenser
	attr_reader :flavors
 
	def initialize(flavors)
		@flavors = flavors.clone
	end

	def pez_count
		flavors.length
	end

	def get_pez
		raise "No pez to eat!" if flavors.empty?
		@flavors.shift

	end

	def add_pez(flavor)
		@flavors << flavor
	end

	def see_all_pez
		 if flavors.empty?
		  	puts "Dispenser Empty"  
		 else 
		 	(1..flavors.length).each{ |n| p "Flavor #{n}: #{@flavors[n-1]}"}
		 end
	end
 
end






# 1. DRIVER TESTS GO BELOW THIS LINE

def assert
	raise "Assertion Failed!" unless yield
end 
flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
assert {super_mario.pez_count == 9}
puts "Here's a look inside the dispenser:"  
puts super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "Now you have #{super_mario.pez_count} pez!"
assert {super_mario.pez_count == 10}
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"
assert {super_mario.pez_count == 9}
p super_mario.get_pez



empty_dispenser = PezDispenser.new([])

begin
	empty_dispenser.get_pez
rescue Exception => e
	mes = e.message
end
p mes
assert {mes == "No pez to eat!"}
assert {empty_dispenser.pez_count == 0}


# 5. Reflection 

=begin
This challenge was pretty basic, but I enjoyed the different approach, working from user stories. 
It was enlightening trying to figure out exactly what each user story wanted. You can implement an 
idea in multiple ways. But in the end, I saw that an array with flavors fit all of the requests best, and 
it also mirrored how a pez dispenser actually works. 

Some things I had to think about: 
how to deal with an empty initialization. I don't think it's out of the question to start with an 
empty pez dispenser, so I didn't put in any assertions
How to deal with printing an empty pez dispenser.
How to deal with popping pez from an empty dispenser. I raised an assertion there. 

One thing that tripped me up in the driver code was the shuffle. Because of it, I couldn't easily test
the exact output of some of the methods. So I was limited with the driver code in that regard, but I think I 
got a fair amount in. 
	
I enjoyed this challenge and am looking forward to more like it. 
=end