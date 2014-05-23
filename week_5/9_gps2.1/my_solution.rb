# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Dylan Krause 
# 2)Neal Peters

 # This is the file you should end up editing. 

 #INITIAL CODE 

 def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} #hash containing num people food feeds
  pie_qty = 0
  cake_qty = 0
  cookie_qty = 0
  
  has_fave = false

  my_list.each_key do |k| #k == food as key; each_key method checks for food
    if k == fav_food
      has_fave = true 
      fav_food = k
    end
  end 
  
  if has_fave == false
    raise ArgumentError.new("You can't make that food") #Raise error if food not found in my_list
  else
    fav_food_qty = my_list.values_at(fav_food)[0] #values_at method returns array; call 1st index and store number for fav food 
    if num_of_people % fav_food_qty == 0 #if the favorite food can divisibly feed everyone return number fed in string 
      num_of_food = num_of_people / fav_food_qty 
      return "You need to make #{num_of_food} #{fav_food}(s)."
    else num_of_people % fav_food_qty != 0 #if the favorite food can't divisibly feed everyone
      while num_of_people > 0 #loop through the number of people and divy however much can feed them; provide smaller food as remainde
        if num_of_people / my_list["pie"] > 0
          pie_qty = num_of_people / my_list["pie"] #Set pie number 
          num_of_people = num_of_people % my_list["pie"] #Set remaining unfed people 
        elsif num_of_people / my_list["cake"] > 0
          cake_qty = num_of_people / my_list["cake"] #Set cake number
          num_of_people = num_of_people % my_list["cake"] #Set remaining unfed people 
        else
          cookie_qty = num_of_people #Give everyone left cookies
          num_of_people = 0
        end
      end
      return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." #Output string with info
    end
  end
end
 
#REFACTORED CODE 
 
 
def bakery_num(people, fav_food)
  food_list = {"pie" => 8, "cake" => 6, "cookie" => 1} #hash containing num people food feeds
  served = Hash.new(0)
  food_list.each{|food, portions| served[food] = 0}
  raise ArgumentError.new("You can't make that food") unless food_list.include? fav_food
  #Serving checker 
  food_servings = food_list[fav_food] 
  if people % food_servings == 0
    portions = people/food_servings
    return "You need to make #{portions} #{fav_food}(s)."
  end
  bake = false 
  food_list.each{ |baked_good, portion| 
    bake = true if baked_good == fav_food
    if bake 
      served[baked_good] = people/portion
      people = people%portion 
    end
  }
  "You need to make #{served["pie"]} pie(s), #{served["cake"]} cake(s), and #{served["cookie"]} cookie(s)." #Output string with info
end

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working.   
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!


#  Reflection 

=begin
  
I worked on this with my GPS Instructor, so I basically navigated and drove, articulating my ideas so 
that Neal understood where I was going. I think my problem with pairing is that I work better when I don't have
to talk. There is a gap between my thoughts and speech that I have to work on. For instance, I usually think through 
a couple of scenarios before I settle on the best one, but if I'm talking I feel pressure to go with the first one in order
to avoid a gap of silence. 

Anyway, the original code for this was hard to understand, but even harder to phrase out. I couldn't properly articulate 
exactly what was going on even though I knew how the system worked. Neal thought I did a good enough job though. 

In terms of refactoring, I started out with my usual approach, trying to organize things in a more readable way. Neal taught me 
the importance of two things: Indenting and checking the code after changes to make sure it still worked. I normally never check 
until the end. 

That said, it was hard to keep everything in working order and make big changes. After I got a nice order in place and took out unnecessary 
material, I saw that a greater restructure would be needed. So I just edited in a new window, so as not to delete anything and ran the code
when I finished. 

I think it could be refactored more. Clearly, there is a repetition in the two return statements. I would use a different output, but I know 
sometimes we must keep the one that is original, and that is the point of this challenge. My code is optimized by about 80%, I'd say. 
The bake boolean seems like a glaring error on my part, but it works to set the baking at the correct food. Maybe I could 
set the food right from the beginning, so earlier ones are always ignored. 
Working through hashes is a little more difficult for me then working in arrays, so there's that too. 

I think, going forward, I'm going to try to give a little more attention to hashes and work on refining code down. I am able to do this conceptually, but not so much 
in practice. 
=end



