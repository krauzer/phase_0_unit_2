# U2.W6: Refactoring for Code Readability


# I worked on this challenge [with: David Sin].


# Original Solution

class CreditCard #Creates a new class CreditCard. Raises an arguement error if the digits of numbers does not equal to 16. #Also creating instance variables 
	def initialize(creditCardNum) #initialize class instance with creditCardNUm argument 
		raise ArgumentError, 'Should be 16 numbers' if Math.log10(creditCardNum).to_i + 1 != 16
		@creditCardNum = creditCardNum
		doubled_number = doubled(creditCardNum)
		@total = sum(doubled_number)
	end

	def doubled(num) #Takes a number and splits it into an array; Rotates elements two spaces to the right so second to #last index becomes the first index
#doubles the elements at even indexes including the 0th index; return the array of indexes 
		arr = num.to_s.split('')
		shifted = arr.rotate(-2)
		@arrOfInt = shifted.map.with_index do |num, index| 
			if index % 2 == 0 || index == 0 
				num.to_i * 2 
			else
				num.to_i 
			end
		end
		arrOfInt
	end

	def sum(arrI) #putting the array into a string and then into integers so that we now have an array of integers. Then #finds the sum
		arrOf_SepInt = arrI.to_s.split('').map(&:to_i)
		arrOf_SepInt.inject(:+)
	end    

	def check_card #checking that the card is valid. total sum must be divisible by 10  
		@total % 10 == 0 ? true : false
	end
end


# Refactored Solution

class CreditCard 
	def initialize(creditCardNum) 
		raise ArgumentError, 'Should be 16 numbers' if creditCardNum.to_s.size != 16
		@creditCardNum = creditCardNum
		@total = sum(doubled(creditCardNum))
	end

	def doubled(num) 
		@arrOfInt = num.to_s.split("").map.with_index do |num, index| 
			(index % 2 == 0 || index == 0) ? (num.to_i * 2) : num.to_i 
		end
		@arrOfInt
	end

	def sum(arrI) 
		arrOf_SepInt = arrI.to_s.split('').map(&:to_i)
		arrOf_SepInt.inject(:+)
	end    

	def check_card 
		@total % 10 == 0 ? true : false
	end
end






# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion Failed!" unless yield 
end

card = CreditCard.new(4563960122001999)
assert{card.check_card} # => true

 card_two = CreditCard.new(4408041234567892)
 assert{card_two.check_card} # => false

 card_three = CreditCard.new(44080412345678)
 card_three.check_card # => should throw error



# Reflection 

=begin
This challenge was a little daunting for me because I had worked on the credit card challenge with Michael, 
and I think we had gotten it down to as refactored as it could be. So, I suppose the challenge is to work with 
different code and see what you can do with it, rather than to rethink the problem all over again. 
I honestly am not fond of such tasks, so it's good to force some practice in. 

I paired with David for this and we worked on some code that had methods we hadn't used before, and it was good practice to
think them through and see if they improved upon what I had done.  

I think there was some good practice here with refactoring somebody else's code. After a while, you get to the point where, potentially 
you can improve the code, but you might have to fundamentally alter it. And then you ask yourself, is it worth it? Will you save on time? Will
it be more readable? I think we got down to as good as it can look with the given code format. 

This exercise wasn't that tedious and it was interesting to go through, but not my favorite!
	
=end