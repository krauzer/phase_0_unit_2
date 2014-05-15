# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
#Input on array method:
	#First argument: non-negative integer 
	#Second argument(optional): single object value   

# What is the output? (i.e. What should the code return?)
	#Output: Modified Array 

# What are the steps needed to solve the problem?
#Setup: 
	#MODIFY Array class by defining two new public methods
		#DEFINE method, pad, with parameter, size, and optional parameter, element defaulted to nil
			#RETURN array (as self) if self.length is less than or equal to the input size
			#DEFINE copy of array called clone_array using the clone method in self
			#DETERMINE how many elements need to be pushed into the clone by subtracting self.length from size
			#PUSH element into clone 
			#RETURN clone implicitly 
		#DEFINE method, pad!


# 2. Initial Solution

class Array 
	def pad(size, element=nil)
		return self if self.length <= size
		clone_array = self.clone
		push_num = size - self.length
		push_num.times{|x| clone_arry.push(element)}
		clone_array
	end

	def pad!()

	end
end 




# 3. Refactored Solution


# 4. Reflection 
=begin
	
I didn't know how to copy arrays in ruby, and I found that simply there are two
go-to object methods for doing this: clone and dup. From what I could gather on stackoverflow
and this site: https://github.com/rubinius/rubinius/blob/master/kernel/alpha.rb#L189, clone 
copies the entire object and it's internal state recursively, and dup creates a new instance of the
class and mirrors the original variables. I don't think it matters for this problem but clone seemed
like the more standard method and the safer one, since dup missed some stuff on some subclasses. 
	
=end







