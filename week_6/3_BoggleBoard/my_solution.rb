# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself].


# 2. Pseudocode
#DEFINE a class, BoggleBoard
	#INITIALIZE class
		#RAISE argument error if initialized with empty array 
		#SET array as board attribute 
	#DEFINE a create word method
		#MAP the coordinates to respective letter in boggle board and then join them 
	#DEFINE a get row method
		#FIND row and join it into a string 
	#DEFINE a get column method 
		#MAP the column index to each element and join all elements from that index to form string representing a column
	#DEFINE a get diagonal method 
		#MARK letters
		#FIND of word 
		#INCREMENT elements unil length is fulfilled




# 3. Initial Solution
class BoggleBoard
 
   def initialize(array)
   	raise ArgumentError.new("Board can't be empty!") if array.empty?
    @board = array
  end

  def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
  end
  
  def get_row(row)
    @board[row].join("")
  end
  
  def get_col(col)
    @board.map{|array| array[col]}.join("")
  end

  def get_diagonal(first_let,last_let) #[3,1], [1,3] OR [0,0][1,1] OR REVERSE
  	word = []
  	i = first_let[0]
  	j = first_let[1]
  	((last_let[0] - first_let[0]).abs+1).times{
  		word << @board[i][j]
  		if first_let[0] < last_let[0] 
  			i += 1
  			j += 1
  		elsif first_let[0] > last_let[0]
  			i -= 1
  			j +=1

  		end
  	}
  	word
  end

 
end
 
 



# 4. Refactored Solution

class BoggleBoard
 
   def initialize(array)
   	raise ArgumentError.new("Board can't be empty!") if array.empty?
    @board = array
  end

  def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
  end
  
  def get_row(row)
    @board[row].join("")
  end
  
  def get_col(col)
    @board.map{|array| array[col]}.join("")
  end

  def get_diagonal(first_let,last_let) 
  	raise ArgumentError.new("Not Diagonal!") if (first_let.first-last_let.first).abs != (first_let.last-last_let.last).abs
  	word = []
  	i = first_let[0]
  	j = first_let[1]
  	((last_let[0] - first_let[0]).abs+1).times{
  		word << @board[i][j]
  		first_let[0] < last_let[0] ? i+=1 : i-=1
  		first_let[1] < last_let[1] ? j+=1 : j-=1
  	}
  	word
  end

 
end
 
 




# 1. DRIVER TESTS GO BELOW THIS LINE
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)


def assert
	raise "Assertion Failed!" unless yield
end


# create driver test code to retrieve a value at a coordinate here:

assert {boggle_board.create_word([3,2]) == "k"}

# implement tests for each of the methods here:

#CREATE WORD 
assert {boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"}
assert {boggle_board.create_word([0,0], [1,0], [3,0]) == "bit"}
assert {boggle_board.create_word([1,3], [0,2], [0,1], [3,0]) == "tart"}

#GET ROW 
assert {boggle_board.get_row(0) == "brae"}
assert {boggle_board.get_row(1) == "iodt"}
assert {boggle_board.get_row(2) == "eclr"}
assert {boggle_board.get_row(3) == "take"}

#GET COLUMN
assert {boggle_board.get_col(0) == "biet"}
assert {boggle_board.get_col(1) == "roca"}
assert {boggle_board.get_col(2) == "adlk"}
assert {boggle_board.get_col(3) == "etre"}

#GET DIAGONAL 

begin
	boggle_board.get_diagonal([0,0],[0,2])
rescue Exception => e
	mes = e.message
end
p mes

assert {boggle_board.get_diagonal([0,0],[2,2]) == ["b","o","l"]}
assert {boggle_board.get_diagonal([1,0],[3,2]) == ["i","c","k"]}
assert {boggle_board.get_diagonal([0,2],[1,3]) == ["a","t"]}
assert {boggle_board.get_diagonal([3,1],[1,3]) == ["a","l","t"]}
assert {boggle_board.get_diagonal([2,2],[0,0]) == ["l","o","b"]}
assert {boggle_board.get_diagonal([3,2],[1,0]) == ["k","c","i"]}
assert {boggle_board.get_diagonal([1,3],[0,2]) == ["t","a"]}
assert {boggle_board.get_diagonal([1,3],[3,1]) == ["t","l","a"]}




# 5. Reflection 

=begin
The directions seemed a little unclear at first with regard to creating driver code, so I just went with 
what made sense. I had created a Boggle Class with Justin, so most of the challenge wasn't difficult. I recalled how 
most of it worked, so there wasn't much refactoring. 

I wasn't sure what they wanted for arguments with regard to the diagonal. I assumed a start and end point, although 
it could have been a start and length. 

The trouble I had with the diagonal was visualizing the indexes. You've got the index, you've got the value that index represents
and you've got what that value translates to on the board. So three different things to juggle in your head. But once I got the incrementing 
down(I originally was trying to use a while loop, but realized it probably wasn't great because no values were changing per se) I was able
to get pretty clean code that works in any diagonal direction, back or forth, up or down. Things worked out better
than using the first and last methods. 

I liked this problem even though the directions were unclear for me. The diagonal exercise was engaging and not tedious. 

=end