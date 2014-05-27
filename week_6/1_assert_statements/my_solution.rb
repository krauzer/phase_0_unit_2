# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself].


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
#assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
#ASSERT method is defined as such: 
	#raise an "Assertion failed" exception unless the yielded block returns true
#variable, name, is set to "bettysue"
#assert method is called with a block in which a boolean comparison exists, name == "bettysue"
	#This block returns true, no assertion error is raised 
#assert method is called with a block in which a boolean comparison exists, name == "billybob"
	#This block returns false, an assertion error is raised 
	#The assertion error is raised, technically as a RuntimeError, which outputs 




# 3. Copy your selected challenge here


def separate_comma(number)
	negative = false
	if number.is_a? Float
		number = number.to_s.split('.')
		decimal = number[1]
		number = number[0]
	end
	output = number.to_s 
	if number[0] == '-'
		number.slice!(0)  
		negative = true
	end
	output = output.reverse.chars.each_slice(3).to_a.collect(&:join).join(',').reverse
	output.insert(0, '-') if negative == true
	output << "." << decimal if decimal 
	output
end


# 4. Convert your driver test code from that challenge into Assert Statements


assert { separate_comma(-1000400005) == "-1,000,400,005"}
assert { separate_comma(-1) == "-1"}
assert { separate_comma(-0.3333333) == "-0.3333333"}
assert { separate_comma(0) == "0"}
assert { separate_comma(0.2323) == "0.2323"}
assert { separate_comma(11) == "11"}
assert { separate_comma(100000) == "100,000"}
assert { separate_comma(10000000000000000000000) == "10,000,000,000,000,000,000,000"}
assert { separate_comma(30232323232.3434332) == "30,232,323,232.343433"}


# 5. Reflection

=begin
	
The benefit of this challenge for me was working with the yield statement. Since this is the first challenge 
to use it, I had to look up what it did again, and I think I'll be able to remember the essentials. I hope we get 
to work on blocks (and procs and lambdas) more. 

I liked that the principles behind this challenge  were simple, but I thought the challenge as a whole 
could have gone deeper into assertions. I'm somewhat familiar with assertions after having researched them a bit, and this challenge 
didn't really go into how they work nor did it cover exceptions. Still, though, it was good to see them get put into a methods, and now I know 
how to work them into driver code. It was helpful to turn old code into new. 

This challenge wasn't difficult. Working with blocs is enjoyable. 
	
=end
