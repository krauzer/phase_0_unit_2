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
			#DEFINE copy of array called clone_array using the clone method in self
			#RETURN clone if clone.length is less than or equal to the input size
			#DETERMINE how many elements need to be pushed into the clone by subtracting clone.length from size
			#PUSH element into clone using times metod on push_num Integer
			#RETURN clone implicitly 
		#DEFINE method, pad!
			#RETURN array (as self) if self.length is less than or equal to the input size
			#DETERMINE how many elements need to be pushed into self by subtracting self.length from size
			#PUSH element into self using times method on push_num Integer
			#RETURN self implicitly 


# 2. Initial Solution

class Array 
	def pad(size, element=nil)
		clone_array = self.clone
		return clone_array if size <= self.length #important to return clone even if self matches
		push_num = size - self.length
		push_num.times{|x| clone_array.push(element)}
		clone_array
	end

	def pad!(size, element=nil)
		return self if size <= self.length 
		push_num = size - self.length 
		push_num.times{|x| self.push(element)}
		return self
	end
end 




# 3. Refactored Solution
#take out unnecessary self references from pad()
#take out explicit returns 
#Switch it up with the concat operator 

class Array 
	def pad(size, element=nil)
		clone_array = self.clone
		clone_array if size <= clone_array.length 
		push_num = size - clone_array.length
		push_num.times{|x| clone_array << element}
		clone_array
	end

	def pad!(size, element=nil)
		self if size <= self.length 
		push_num = size - self.length 
		push_num.times{|x| self.push << element}
		self
	end
end 



# 4. Reflection 
=begin

This was a good challenge on creating public methods. I think the fundamental take away for 
me was to be aware on what you operate with when you're dealing with destructive and non-destructive
methods.  

I realized that returning the self for a non_destructive method was a bad idea even
if the self is exactly as the clone because the clone is fundamentally the same object.
 This led me to consciously choose not to operate with self if I didn't have to.
I determined everything from the clone once it had been created. 
	
Speaking of clones, I didn't know how to copy arrays in ruby, and I found that simply there are two
go-to object methods for doing this: clone and dup. From what I could gather on stackoverflow
and this site: https://github.com/rubinius/rubinius/blob/master/kernel/alpha.rb#L189, clone 
copies the entire object and its internal state recursively, and dup creates a new instance of the
class and just mirrors the original variables on to that instance. I don't think it matters for 
this problem but clone seemed like the more standard method and the safer one,
since dup missed some stuff on some subclasses. 

The problem wasn't tedious nor was the entire outlining. The refactored code did look cleaner, 
I enjoyed looking at the test outputs when they failed. I'm trying to think more
about what would make good tests. This one had some good ones. I think I'm improving on all 
fronts. 

	
=end







