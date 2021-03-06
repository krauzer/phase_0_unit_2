# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
	list = []
  source.each{|x| list << x if x.to_s.include? thing_to_find}
  	list
end

def my_hash_finding_method(source, thing_to_find)
  names = []
  source.each{|key, value| names << key if value == thing_to_find }
  names 
end

# Identify and describe the ruby method you implemented. 
# Include method tests to see if a value is included and returns a boolean
#
#

# Person 2
def my_array_modification_method(source, thing_to_modify)
  source.map!{|x| (x.is_a? Integer) ? x + thing_to_modify : x }
end

def my_hash_modification_method(source, thing_to_modify)
  source.each{|key, value| source[key]+= thing_to_modify}
end

# Identify and describe the ruby method you implemented. 
# map method maps code onto each element of an enumerable 
#
#


# Person 3
def my_array_sorting_method(source)
  copy = source.map{|x| x.to_s}
  copy.uniq.sort!
end

def my_hash_sorting_method(source)
  copy =  source.sort_by{|key, value| value }
end

# Identify and describe the ruby method you implemented. 
# sort method sorts based on value 
#
#


# Person 4
def my_array_deletion_method(source, thing_to_delete)
  source.delete_if {|x|  x.to_s.include?(thing_to_delete) }
end

def my_hash_deletion_method(source, thing_to_delete)
  source.delete_if {|key,value| thing_to_delete == key }
end


# Identify and describe the ruby method you implemented. 
# It's a deletion method that takes a block and deletes from 
# the block whatever element meeets the conditions 
# of that block. Since input may not exactly match the element of the array
# it's better than delete. 


################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!
=begin 

I watched a video on navigating through the ruby docs and it explained the notation of the metods, 
which I hadn't really thought about. There are a couple options for deletions, but I chose the one
that made most sense for the problem. The thing I learned was how to read the documentation 
specification for the methods (inputs, outputs, syntax), and, I guess, how to describe these features. 

I was having trouble with the drive code at first, but I realized it was working on objects that had 
been modified by other methods, so I wrote my own driver code, and it passed. 

Methods and testing are definitely sinking in more. I have to spend more time reading the documentation. 
Because my part of this challenge was small, it wasn't tedious. 


=end





