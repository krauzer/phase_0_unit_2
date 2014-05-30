# U2.W6: Drawer Debugger


# I worked on this challenge [by myself]


# 2. Original Code

class Drawer

	attr_reader :contents

# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing?
		@contents.delete(item)
		item
	end

	def dump  # what should this method return?
		puts "Your drawer is empty."
		@contents = []
	end

	def view_contents
		puts "The drawer contains:"
	@contents.each {|silverware| puts "- " + silverware.type }
	end
end

class Silverware
	attr_reader :type, :clean

# Are there any more methods needed in this class?

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end
	def clean_silverware
		@clean = true
	end
end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?

final_fork = Silverware.new("fork")
silverware_drawer.add_item(final_fork)
fork = silverware_drawer.remove_item(final_fork) #add some puts statements to help you trace through the code...
fork.eat

#BONUS SECTION
puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Assertion failed" unless yield 
end
silverware_drawer.add_item(fork)
assert {silverware_drawer.contents.empty? == false}
silverware_drawer.dump
assert {silverware_drawer.contents.empty? == true}
silverware_drawer.add_item(Silverware.new("butter_knife"))
assert {silverware_drawer.contents.empty? == false}
silverware_drawer.open
silverware_drawer.view_contents
goods = silverware_drawer.remove_item
p goods #item is popped before it is deleted? 
assert {goods.type == "butter_knife"} #ASSERTION FAILS without code mod; deleted item is nil
p silverware_drawer.view_contents


# 5. Reflection 
=begin
This was a fun, engaging exercise. I like working with
classes and their methods and figuring out what they do. 
I think these classes could have been a little more complex,
but they were good nonetheless. I wasn’t sure how much we were 
supposed to modify the code. I think I could have added a lot more. 

In testing with assertions I picked up on something I had missed,
which is that when removing an unnamed item, popping it from the 
array removes it, so the deletion returns nil because it no longer is 
within the contents. I think this is probably bad code and could be fixed, 
but why is it bad code? Was it just because delete returned nil? 
I don’t think a user should have any guarantee that the item is returned. 
I made sure the code returned the item removed anyway.  

Overall, not a difficult challenge but a bit ambiguous.  

	
=end