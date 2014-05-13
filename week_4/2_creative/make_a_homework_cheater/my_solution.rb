# U2.W4: Homework Cheater!


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: The following strings: a title, a topic, a thesis statement, a pronoun. A numderical date
# Output: A paragraph of string type 
# Steps:
	#DEFINE essay_writer method
	#PUTS Title 
	#FORMAT a paragraph to do the following: 
		#DESCRIBE a person
		#REFERENCE a major accomplishment and it's date
		#PRESENT thesis statement 
		#INCLUE some filler using pronoun



# 3. Initial Solution
def essay_writer(title, name, major_accomplishment, year_of_accomplishment, thesis, pronoun)
	puts "Final Assignment Essay:\n #{title}
	\n
	#{date_of_accomplishment} was the year of #{name}. #{major_accomplishment.capitalize},
	does that ring a bell? That was all thanks to #{name}. \n 
	#{thesis} \n
	Much more could be said of #{name}. #{pronoun.capitalize} is somebody worth remembering. 
	"
	
end



# 4. Refactored Solution
#I don't think it needs to be refactored other than removing a newline. I can put it all on one line, but it'll be less readable. 
def essay_writer(title, name, major_accomplishment, year_of_accomplishment, thesis, pronoun)
	puts "Final Assignment Essay:\n #{title}
	\n
	#{year_of_accomplishment} was the year of #{name}. #{major_accomplishment},
	does that ring a bell? That was all thanks to #{name}. #{thesis} 
	\n
	Much more could be said of #{name}, but I believe in brevity. #{pronoun.capitalize} is somebody worth remembering. 
	"
	
end







# 1. DRIVER TESTS GO BELOW THIS LINE
#TEST 1: 
essay_writer("The Story of Einstein", "Albert Einstein", "General Relativity", 1916, "General relativity develops the idea of spacetime as one feature of the universe.", "he")
#TEST 2: 
essay_writer("Modern Literature", "Ernest Hemmingway", "A Farewell to Arms", 1929, "Hemmingway was a modernist writer who was known for his short style.", "he")
#TEST 3: 
essay_writer("The Rise of the Tories", "Margaret Thatcher", "The Falklands War", 1982, "Thatcher was best buds with Reagan.", "she")




# 5. Reflection 

=begin
	
I thought this challenge was too tedious. A lot of effort needed just to come up with the ideas 
and then there isn't really much development, although it was good practice for formatting text via ruby. 
The problem was, it didn't really print well on my terminal, so I couldn't tell where best to put the newlines. 
I think this would have benefited from prewritten text that we could have manipulated. The more you want to do 
the more information you need. 

I didn't see how some of the learning competencies applied to this. 

I may come back to this to work on the optional or complete the other challenge as well. 
	
=end


