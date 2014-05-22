# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [with: Michael Weiss].

# 2. Pseudocode

# Input: A 16 digit integer
# Output: class object CreditCard and for the method check card a Boolean true or false.
# Steps:
# Initialization
# 1.) Initialize a credit card class with the argument called num for number.
# 2.) Convert num to a String and then raise an argument error if that string 
# doesn't have a length of 16.
# 3.) Store it as an Instance variable called @num.


# Method: check_card
# 1.) num to an array with split method
# 2.) Use .each_with_index method to check the index and if it is divisible by 
# two and double it.
# 3.) Iterate over each index adding it to the sum if it is less than 10 and
# adding them up and if it is greater than 9 add the ones digit to 1 and then add 
# it to the sum.
# 4.) If the sum is divisible by 10 return true else false.

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits

class CreditCard
  def initialize(num)
    raise ArgumentError.new("Credit Card number should have 16 integers") if num.to_s.size != 16
    @num = num.to_s
  end
    
  def check_card
    sum = 0
    @num.split("").each_with_index { |digit, index| 
      	digit = digit.to_i
     	 if index % 2 == 0 && digit*2 >= 10 
      	  sum += (digit*2 % 10) + 1 
     	 elsif index % 2 == 0  
      	  sum += digit * 2  
      	else  
      	  sum += digit 
     	end 
      }
    return sum % 10 == 0 
	end
end



# 4. Refactored Solution
class CreditCard
  def initialize(num)
    raise ArgumentError.new("Credit Card number should have 16 integers") if num.to_s.size != 16
    @num = num.to_s
  end
    
  def check_card
    sum = 0
    @num.split("").each_with_index {|digit, index| 
      digit = digit.to_i
        sum += (digit*2 >= 10 ? digit*2 % 10 + 1 : digit*2) if index % 2 == 0
        sum += digit if index % 2 == 1
      
      }
    sum % 10 == 0 
    end
end






# 1. DRIVER TESTS GO BELOW THIS LINE
begin
  CreditCard.new(12345678912345678)
rescue ArgumentError => e
  message = e.message 
end 
p message == "Credit Card number should have 16 integers"

card = CreditCard.new(4408041234567893)

p card.check_card == true 

badcard = CreditCard.new(4408041234567892)

p badcard.check_card == false






# 5. Reflection 

=begin

This turned out to be not as difficult as it first appeared. I think Michael and I circumvented reading the 
number backwards by accepting it was a number of even length and just doubled alternating indexes from 
the beginning, but we could have dealt with differing length numbers by checking if the number were of odd 
or even length and then just working from the 1st or 2nd index. The calculation ended up working out nicely with 
a couple of methods used and an emphasis on the modulo operator. 

We spent a lot of time thinking about refactoring because we saw some repetition, but were unable to get around repeating 
one line (sum +=) because we had to check three versions of the input. Other than that, there weren't any problems. 

We also thought a lot about trying to implement a credit card number generation, so users wouldn't have to 
input a number, but it seemed to get more complicated the more we thought about it. 

Overall, this challenge was a good culmination of the work that's led up to this. I'm looking forward to implementing 
more algorithm heavy classes, rather than just ones that define a bunch of properties and print out statements. 

=end

