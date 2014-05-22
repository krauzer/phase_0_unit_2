# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge with: Justin Lee.

#ALTERED the boggle_board variable, so it is global for the first initial code
$boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]

# Part 1: Access multiple elements of a nested array

# Pseudocode

# DEFINE method, get_row, that takes an integer as an input called row
  # SET a variable board to equal boggle_board
  # RETURN board with the indexed at row

# Initial Solution

def get_row(row)
    board = $boggle_board
    return board[row]
end

# Refactored Solution

def get_row(row)
    $boggle_board[row]
end

# DRIVER TESTS GO BELOW THIS LINE

get_row(1) ==  ["i", "o", "d", "t"]

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode

#DEFINE a method, get_col, that takes an integer as an input called col
  #SET board to global var boggle_board 
  #RETURN board with map method that maps to each array and array[col] 

# Initial Solution

def get_col(col)
    board = $boggle_board
    board.map{|array| array[col]}
end

# Refactored Solution

def get_col(col)
    $boggle_board.map{|array| array[col]}
end

# DRIVER TESTS GO BELOW THIS LINE

get_col(1) ==  ["r", "o", "c", "a"]


#-------------------------------------------------------------------------------

# Part 3: Write a class Boggle with methods initialize, create_word, get_row, and get_col.

# Pseudocode

#DEFINE a class, Boggle
  #DEFINE initialize that takes an input letters and size
    # RETURN letters with split method that splits the string into an array
    # and then shuffle  
    # then each slice method that slices the array by side_size
  #DEFINE method that takes splat coords, one or more coords
    # RETURN coords with map method that takes each coord in coords and joins them into a string
  # DEFINE method, get_row, that takes an integer as an input called row
    # SET a variable board to equal boggle_board
    # RETURN board with the indexed at row
  #DEFINE a method, get_col, that takes an integer as an input called col
    #SET board to global var boggle_board 
    #RETURN board with map method that maps to each array and array[col]
  
#Initial Code
class Boggle
  def initialize(letters, side_size)
    @board = letters.split("").shuffle.each_slice(side_size).to_a
  end

  def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
  end
  
  def get_row(row)
    @board[row]
  end
  
  def get_col(col)
    @board.map{|array| array[col]}
  end

end 

#REFACTORED Code 
#same as above 


#DRIVER TESTS

boggle_board = Boggle.new("braeiodteclrtake", 4)

p row = boggle_board.get_row(1)
p row.length == 4
p column = boggle_board.get_col(0)
p column.length == 4

#REFLECTION 

=begin
 
 This challenge was a little ambigious, but Justin and I progressed to eventually creating a Boggle 
 class that solved the problems we faced early on. 

 The main problem we had was that boggle_board was not a global variable and therefore couldn't be read
 within the method. How do we fix that? We just changed it to a global but realized it wasn't good form to 
 allow manipulation of a variable from within a method. We could either add another argument to the method,
 that took a boggle_board for cloning but since that wasn't implied in the prewritten code, we kept the global
 and just made sure the manipulation was non-destructive. 

But it would have been something like this: 

def get_row(board, row)
  new_board = board.dup
  new_board[row]
end

def get_col(board, col)
  new_board = board.dup
  new_board.map!{|array| array[col]}
end

In our reviewing we learned about a new array method, transpose, that would have worked well for 
the column problem. It is now saved in the memory bank. 

We also saw that classes offered a solution to our problem, and construction of one fit the general 
theme of this week, so we went ahead and made one with a twist. Instead of including a premade nested array, 
we allowed for a string of letters, and side size, and coded to make the board from that. This didn't 
allow for good testing since the letters were shuffled, but it made it more creative. We thought about having
random letters, but we would have needed to come up with a good way to make sure there were enough vowels so word 
could be created. We also thought about creating a show_boggle_board method but we didn't get to it. 


This challenge was insightful. It helped with nested array, and maninpulating class objects. I had a little trouble 
figuring out how to use driver tests with a class, so I'm going to try and work on that more. If you convert an object 
to an array, it still is a class object before an array (or something like that). I need a better understanding of how 
class objects represent themselves and of how to read such objects. 


=end
  
  