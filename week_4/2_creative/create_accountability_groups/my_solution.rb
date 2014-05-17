# U2.W4: Create Accountability Groups


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: Array of Names 
# Output: Hash of units with values and array of lists as subarrays of four. 
 #Print: Group lists  
# Steps:
#DEFINE a method that shuffles the inputed array, breaks it into subarrays of four or five elements, and sorts them alpahbetically 
	#DECLARE variable, left_over, that logs amount that can't fit into an array of four 
	#SHUFFLE the array
	#SLICE the array into subarrays of four and convert from Enumerable Object to array
	#IF there are any in an uneven last group, add them one by one to the full groups, starting at the first index
	#DELETE last element of array after
	#SORT the subarrays based on name 
	#RETURN array 

#DEFINE a unit creation method that takes a list of names and the number of units
	#DEFINE an empty hash to store lists and be returned at end of creation 
	#FOR every Unit phase (iterate using range): 
		#CREATE array of groups for a unit using the shuffle_sort function 
		#IF the output hash is empty: 
			#ADD unit array to hash with unit number as key, and unit array as value 
		#ELSE test to see that there are no duplicate groups: 
			#ITERATE through each existing unit key/value
				#COMPARE value of said pair with created unit array and check for intersections 
				#UNTIL no intersection exists
					#RECREATE unit array via shuffle_sort funcion 
			#ADD unit array to hash with unit number as key, and unit array as value 
		#PRINT Unit phase number 
		#ITERATE through each subarray 
			#PRINT out group number
			#PRINT out each person as member of said group 
	#RETURN output hash 



# 3. Initial Solution
ny_group = [ "Hilary Barr","Alan Florendo", "Cassie Moy", "Dylan Richards", "Stephen Estrada", "Austin Hay", "Anthony Edward", "John Berry", "Kaitlyn La", "Farheen Malik", "Daniel Deepak", "RJ Arena", "Justin Lee", "Derek Siker", "Michael Weiss", "David Sin", "Julius Jung", "Fahia Mohamed", "Dylan Krause", "Molly Huerster", "Eric Hou", "Avi Rosen", "Joel Yawili"]


def shuffle_sort(big_list)
	left_over = big_list.length % 4
	unit = big_list.shuffle.each_slice(4).to_a
	if left_over > 0
		left_over.times{|i| unit[i] << unit[-1][i]} #Dependent on group # being more than remainder; should check 
	end
	unit.delete_at(-1)
	unit.map(&:sort) #Sort for checking for intersections
end

def group_lister(big_list, unit_num)
	output = {}
	(1..unit_num).each {|x|  #Use Range Class method
		unit = shuffle_sort(big_list) #set unit groups 

		if output.empty?
			output[x] = unit
		else 
			(1..x).each{|set_unit| #For every unit that is already set,
				until (unit & output[set_unit]).empty? #check to make sure new groups don't repeat
					unit = shuffle_sort(big_list)
				end
			output[x] = unit #set unit if no repeats
			} 
		end 


		p "Unit: #{x}"
		i = 0
		unit.map{|member| #print out groups in good format
 			 i += 1
 			 p "Group: #{i}"
 			 p "Person One: #{member[0]}"
 			 p "Person Two: #{member[1]}"
 			 p	"Person Three: #{member[2]}"
 			 p	"Person Four: #{member[3]}"
 			 p  "Person Five: #{member[4]}" if member[4]
 			}
 		}

 		output 
end

# 4. Refactored Solution
# I edited while codeing the initial/debugging it so there aren't many changes with refactoring

def shuffle_sort(big_list)
	left_over = big_list.length % 4
	unit = big_list.shuffle.each_slice(4).to_a
	if left_over > 0
		left_over.times{|i| unit[i] << unit[-1][i]}
	end
	unit.delete_at(-1)
	unit.map(&:sort) 
end

def group_lister(big_list, unit_num)
	output = {}
	(1..unit_num).each {|x|  
		unit = shuffle_sort(big_list) 
		if output.empty?
			output[x] = unit
		else 
			(1..x).each{|set_unit| 
				until (unit & output[set_unit]).empty? 
					unit = shuffle_sort(big_list)
				end
			output[x] = unit 
			} 
		end 

		p "Unit: #{x}"
		i = 0
		unit.map{|member| 
 			 i += 1
 			 p "Group: #{i}"
 			 p "Person One: #{member[0]}"
 			 p "Person Two: #{member[1]}"
 			 p	"Person Three: #{member[2]}"
 			 p	"Person Four: #{member[3]}"
 			 p  "Person Five: #{member[4]}" if member[4]
 			}
 		}

 		output 
end

group_lister(ny_group, 3)



# 1. DRIVER TESTS GO BELOW THIS LINE

#TESTER ARRAY 
let_array = ("a".."z").to_a

#TEST TO SHOW EACH ELEMENT IS PLACED ONCE IN EACH UNIT

def test_all_vals_included(array, units=3)
	result = group_lister(array, units)

	result.each_value {|value_array| 
		("a".."z").each{ |el| return false if value_array.flatten.count(el) != 1
				}
		}
		return true 
end 

p "ERROR: ELEMENT UNEVENLY ADDED" if test_all_vals_included(let_array) != true

#TEST TO MAKE SURE ALL ELEMENTS IN ORIGINAL ARRAY 

def test_all_vals_original(array, units=3)
	result = group_lister(array, units)

	result.each_value {|value_array| 
		value_array.flatten.each{|el| return false if !("a".."z").include? el}
				
		}
		return true 
end 

p "ERROR: FOREIGN ELEMENT INVADED" if test_all_vals_original(let_array) != true

# TEST TO MAKE SURE THERE ARE NO REPEAT GROUPS

def test_all_groups(array, units=3)
	result = group_lister(array, units)
	bank = []
	result.each_value {|value_array| bank.push(value_array)}
	bank.map!(&:flatten)
	return false if bank.uniq.length != bank.length 
	true 
end 

p "ERROR: DUPLICATE GROUPS" if test_all_groups(let_array) != true


# 5. Reflection 
=begin 

First thing I thought about was in what manner I wanted to create the groups. I saw two conceptual 
possibilities:
	1. Throwing all the names in a bag, shaking them, and having them fall into groups
		or
	2. Funneling people into groups name by name, almost in a chute fashion. 

I settled on trying to achieve the second route because it seemed like something I could have more control 
over and it would better allow for preventing overlap in groups. 

This was a very frustrating plan. I realized it was more complex than I thought, and it wouldn't 
necessarily prevent duplicate groups even if I implimented some algo that reduced the chance 
of overlap between groups. 

I was completely frustrated before I even started because the algo never materialized, and
I was deep into thinking about tagging each name in some way with a key. It got too complex for me. 
I could have made everyone an object and worked through properties, but that would have gone beyond the 
parameters of this challenge, I think. 

So I just decided to prevent duplicate groups. Once I started working with this goal in mind, I 
got into a good rhythm. 

I realized I might have to repeat shuffles and grouping so I switched this out to a separate function. It wasn't too 
hard to make, but I realized just now it would break if there were more leftover names than groups. This wouldn't show 
if there were more than two groups for group sizes of 4, but I'll have to go back and fix it at some point. 

The group_lister function was a little harder, but I split it into two parts, a printer and a tester. 
I knew too, I needed to log everything and return it at the end in addition to printing, so I chose a hash. 
It wasn't so hard once I put goals to it: return and object, check that object, print out values

My biggest challenge was working through loops. Ruby loops still trouble me. They aren't intuitive. I wish 
I could work with 'for' loops and 'in' operators, but it's bad ruby practice or impossible, so I'll just 
have to get used to these methods. 

Writing the driver code was fun as was thinking about what should be tested. I became more familiar with 
a bunch of new methods (each_value, uniq, flatten, &, each_slice, shuffle, delete_at, count) and the Range class. 

I used the docs and stackoverflow for solving problems, but there aren't really any concepts I don't understand. 
Performing complex looping and iterations is the challenge for me. Getting to an element I want to examine. 
 I wasn't able to do what I originally intended and it was partly because I couldn't think of a way 
 to better manipulate an array. 


I wish this stage of ruby wasn't so dependent on looking for methods that fits my needs. 
=end 
