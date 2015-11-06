# A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent [4] hours on this challenge.


# Release 0: Pseudocode
# Outline:

# Containers:

#   1. create a hash where the keys are the letters in bingo and the values
#      are set from 0 to 4 respectively
#   2. bingoboard is an array of arrays, 5 x 5

# Create a method to generate a letter ( b, i, n, g, o) and a number (1-100)

#   1. set "index" equal to a random number between 0 and 4
#      a. set "letter" to be a letter, mapping "index" 0 to "b", "index" 1 to "i"
#         and so on.
#   2. set "number" equal to a random between 1 - 100

# Check the called column for the number called.

#   1. use "letter" to find the index (column) we want to look at in each array
#   2. iterate through the arrays checking for "number" at the index found above


# If the number is in the column, replace with an 'x'
  #fill in the outline here
#   1. assign the value 'x' to the position in the arrays where a match was found

# Display a column to the console
  #fill in the outline here
#   1. user selects column to display using a letter
#   2. use letter to find internal "letter" and corresponding "index" value
#   3. display the column name as "letter"
#   4. iterate through the array of arrays
#      a. display the value of the element in the current array at "index"
#      b. output a newline character
#      c. move to next array


# Display the board to the console (prettily)

#   1. display the "letter" names of the columns  
#   2.  using tab character to format and space, iterate through the arrays, 
#       displaying each array on its own line
#      a. iterate through the array of arrays
#      b. use tab characters to space out elements of each array on one line
#      c. add newline character at the end of each array
#      d. move to the next array in the array of arrays and return to step b


# Initial Solution
=begin

class BingoBoard
  # This constant tells the check_number method which index
  # of the array it should look at to find the column name
  COLUMN = 0

  # This constant tells the check_number method which index
  # of the array it should look at to find the number value
  NUMVALUE = 1

  @@letter = {"B" => 0, "I" => 1, "N" => 2, "G" => 3, "O" => 4}

  # Range specifies the value ranges for each of the five
  # columns on the bingo board when the board is generated
  # internally
  @@ranges = [1..15, 16..30, 31..45, 46..60, 61..75]
  @@free_space = "X"

  @@legal_board = false

  ##
  # Creats a new bingo board for a game of bingo.  If any array
  # of arrays is passed in, it will create the board from that 
  # array.  If nothing is passed in it will randomly generate
  # a "true" bingo board internally.
  def initialize(*args)
    @bingo_board = Array.new
    args.empty? ? create_board : @bingo_board = args[0]
    @called_num = Array.new

  end

  ##
  # Creates a random and  "true" bingo board with all numbers
  # in the correct ranges for each column.  Also sets the 
  # space on the board to be an "X" as "free" space.  This
  # method calls create_number_sets and pivots that data to
  # the proper orientation for use a bingo board.
  def create_board
    @@legal_board = true
    num_set = create_number_sets
    temp_ary = Array.new
    num_set.each_with_index do | num_ary, i|
      num_set.each {|e| temp_ary << e[i]}
      @bingo_board[i] = temp_ary
      temp_ary = []
    end
    @bingo_board[2][2] = @@free_space
  end

  ##
  # Creates a matrix of numbers as an array of arrays, 5 x 5
  # in size.  This matrix is pivoted horizonally and must be
  # pivoted before use as a legit bingo board.
  def create_number_sets
    horizontal_ary = Array.new
    five_ary = Array.new
    @@ranges. each do |range|
      five_uniq_values = false
      while !five_uniq_values
        5.times {five_ary << rand(range) }
        five_ary.uniq!
        if five_ary.length == 5
          horizontal_ary << five_ary
          five_uniq_values = true
        end
        five_ary = []
      end
    end
    horizontal_ary
  end


  ##
  # Generates a random number between 0 and 4 to represent
  # the column and generates a second number within the proper
  # range for that column.
  # The first number determines the column number and thus 
  # letter, the second is the number within the column.  
  # Returns an array where the first index is the corresponding 
  # letter as a string and the second number is the number 
  # within the column. For example: ["G", 45]  
  def call_number
    if !@@legal_board
      alt_call_number 
    else
      column_index = rand(4)
      number = rand(@@ranges[column_index])
      @called_num = [@@letter.key(column_index), number]
    end
  end

  def alt_call_number
    puts "Calling alt_call_number"
    column_index = rand(4)
    number = rand(99) + 1
    @called_num = [@@letter.key(column_index), number]
  end

  ##
  # Iterates through the array of arrays by column to see if
  # it finds a match.  If it does, it replaces the matching
  # number on the board with an "X"
  def check_number
    raise_error("You must call a number before you can check it") if @called_num.empty?
    column = @@letter[@called_num[COLUMN]]
    @bingo_board.each do |row|
      if row[column].to_i == @called_num[NUMVALUE].to_i
        row[column] = "X"
      end
    end
  end

  ##
  # Beginning of creating a method to check if "Bingo"
  # has happened i.e. a vertical, horizontal, or diagonal
  # of the board is all "X"s.
  def bingo?
    win = false
    check_vertical
    #check_horizontal
    #check_diagonal
    win
  end

  ##
  # Checks each vertical column to see if it is all filled
  # with "X"s.
  def check_vertical
    @@letter.values.each do |column|
      all_x = true
      @bingo_board.each do |row|
        if row[column].to_i != "X".to_i
          all_x = false
        end
      return true if all_x
      end
    end
  end


  ##
  # Displays a single column of the bingo board with the letter
  # name of the column at the top
  def display_column(letter)
    puts @@letter.key(letter)
    @bingo_board.each do |ary|
      puts ary[letter]
    end  
  end

  ##
  # Displays the whole bingo board
  def display_board
    @@letter.each {|l, n| print "#{l} \t"}
    print "\n"
    @bingo_board.each do |ary|
      ary.each {|n| print "#{n} \t"}
      print "\n"
    end
  end
  
  ##
  # Generic error handling method which accpets a string as an
  # argument.  Also aborts execution of the program
  def raise_error(msg)
    puts msg
    puts "Exiting program..."
    abort
  end

end
=end

# Refactored Solution
class BingoBoard
  # This constant tells the check_number method which index
  # of the array it should look at to find the column name
  COLUMN = 0

  # This constant tells the check_number method which index
  # of the array it should look at to find the number value
  NUMVALUE = 1

  @@letter = {"B" => 0, "I" => 1, "N" => 2, "G" => 3, "O" => 4}

  # Range specifies the value ranges for each of the five
  # columns on the bingo board when the board is generated
  # internally
  @@ranges = [1..15, 16..30, 31..45, 46..60, 61..75]
  @@free_space = "X"

  @@legal_board = false

  ##
  # Creats a new bingo board for a game of bingo.  If any array
  # of arrays is passed in, it will create the board from that 
  # array.  If nothing is passed in it will randomly generate
  # a "true" bingo board internally.
  def initialize(*args)
    @bingo_board = Array.new
    args.empty? ? create_board : @bingo_board = args[0]
    @called_num = Array.new

  end

  ##
  # Creates a random and  "true" bingo board with all numbers
  # in the correct ranges for each column.  Also sets the 
  # space on the board to be an "X" as "free" space.  This
  # method calls create_number_sets and pivots that data to
  # the proper orientation for use a bingo board.
  def create_board
    @@legal_board = true
    num_set = create_number_sets
    # temp_ary = Array.new
    # num_set.each_with_index do | num_ary, i|
    #   num_set.each {|e| temp_ary << e[i]}
    #   @bingo_board[i] = temp_ary
    #   temp_ary = []
    # end
    @bingo_board = num_set.transpose
    @bingo_board[2][2] = @@free_space
  end

  ##
  # Creates a matrix of numbers as an array of arrays, 5 x 5
  # in size.  This matrix is pivoted horizonally and must be
  # pivoted before use as a legit bingo board.
  def create_number_sets
    horizontal_ary = Array.new
    five_ary = Array.new
    @@ranges. each do |range|
      five_uniq_values = false
      while !five_uniq_values
        5.times {five_ary << rand(range) }
        five_ary.uniq!
        if five_ary.length == 5
          horizontal_ary << five_ary
          five_uniq_values = true
        end
        five_ary = []
      end
    end
    horizontal_ary
  end

  ##
  # Generates a random number between 0 and 4 to represent
  # the column and generates a second number within the proper
  # range for that column.
  # The first number determines the column number and thus 
  # letter, the second is the number within the column.  
  # Returns an array where the first index is the corresponding 
  # letter as a string and the second number is the number 
  # within the column. For example: ["G", 45]  
  def call_number
    if !@@legal_board
      alt_call_number 
    else
      column_index = rand(4)
      number = rand(@@ranges[column_index])
      @called_num = [@@letter.key(column_index), number]
    end
  end

  ##
  # If the board wasn't generated internally we can't know whether
  # only the appropriate value ranges are in each column, so we use
  # a more generic form.  Column to check in is still a random number
  # between 0 and 4, but the number value is randomly generated 
  # between 1 and 100 regardless of column.
  def alt_call_number
    puts "Calling alt_call_number"
    column_index = rand(4)
    number = rand(99) + 1
    @called_num = [@@letter.key(column_index), number]
  end

  ##
  # Iterates through the array of arrays by column to see if
  # it finds a match.  If it does, it replaces the matching
  # number on the board with an "X". If a number has not been
  # called, it will send a message to the raise_error method
  def check_number
    raise_error("You must call a number before you can check it") if @called_num.empty?
    column = @@letter[@called_num[COLUMN]]
    @bingo_board.each do |row|
      if row[column].to_i == @called_num[NUMVALUE].to_i
        row[column] = "X"
      end
    end
  end

  # def tranpose_board
  #   @bingo_board = @bingo_board.transpose
  #   display_board
  # end

  ##
  # Beginning of creating a method to check if "Bingo"
  # has happened i.e. a vertical, horizontal, or diagonal
  # of the board is all "X"s.
  def bingo?
    win = false
    puts "cv : #{check_vertical}"
    puts "ch : #{check_horizontal}"
    puts "cd : #{check_diagonal}"
    if check_vertical || 
       check_horizontal ||
       check_diagonal
       win = true
     end
    win
  end

  ##
  # Checks each vertical column to see if it is all filled
  # with "X"s. Actually transposes the board, sends a call
  # to check check_horizontal, and then transposes again
  def check_vertical
    @bingo_board = @bingo_board.transpose
    win = check_horizontal
    @bingo_board = @bingo_board.transpose
    win
  end

  def check_horizontal
    win = false
    @bingo_board.each do |row|
      win = true if row.all? {|e| e == "X"}
    end
    win
  end

  def check_diagonal
    diag_tlbr = []
    diag_bltr = []
    rvs_index = -1
    @bingo_board.each_with_index do |row, index|
      diag_tlbr << row[index]
      diag_bltr << row[rvs_index]
      rvs_index -= 1
    end
    if diag_bltr.all? {|e| e == "X"} || diag_tlbr.all? {|e| e == "X"}
      return true
    else 
      return false
    end

  end

  ##
  # Displays a single column of the bingo board with the letter
  # name of the column at the top
  def display_column(letter)
    puts @@letter.key(letter)
    @bingo_board.each do |ary|
      puts ary[letter]
    end  
  end

  ##
  # Displays the whole bingo board
  def display_board
    @@letter.each {|l, n| print "#{l} \t"}
    print "\n"
    @bingo_board.each do |ary|
      ary.each {|n| print "#{n} \t"}
      print "\n"
    end
  end
  
  ##
  # Generic error handling method which accpets a string as an
  # argument.  Also aborts execution of the program
  def raise_error(msg)
    puts msg
    puts "Exiting program..."
    abort
  end

  # Declare which methods are private
  private :alt_call_number, :create_number_sets, :create_board,
           :check_vertical, :check_horizontal, :check_diagonal,
           :raise_error
end




#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE
board = [[47, 44, 71, 8, 88],
        [22, 69, 75, 65, 73],
        [83, 85, 97, 89, 57],
        [25, 31, 96, 68, 51],
        [75, 70, 54, 80, 83]]
#new_game = BingoBoard.new(board)
new_game = BingoBoard.new()
puts "Display BingoBoard"
new_game.display_board

=begin
puts "Display column"
new_game.display_column(2)
=end

=begin
puts "Calling #check_number..."
new_game.check_number
=end

puts "Calling call_number..."
p new_game.call_number

puts "Calling #check_number..."
new_game.check_number

puts "Display BingoBoard"
new_game.display_board

puts "Bingo?"
puts new_game.bingo?

# Let the program play an entire game until it wins
new_game = BingoBoard.new()
while !new_game.bingo? 
  puts "Calling call_number..."
  p new_game.call_number

  puts "Calling #check_number..."
  new_game.check_number

  puts "Display BingoBoard"
  new_game.display_board
end

puts "Display BingoBoard"
new_game.display_board

# puts "Display BingoBoard tranposed"
# new_game.tranpose_board

#Reflection
=begin

How difficult was pseudocoding this challenge? What do you think of your pseudocoding style?
  I am definitely getting better, but have a long way to go.  This challenge required much
  more pseudocoding, and as it turned out, although I did it quite explicitly I found myself
  making adjustments on the fly when I began the actual coding. I am still working on my style.


What are the benefits of using a class for this challenge?
  Class variables and constants are certainly a benefit, as well as the ability to make
  some methods private so that users can't muck about with how the program works or make
  calls to methods they have no place making.  If I were doing it again, I might opt to
  make a parent class that could deal with matrices and then make the BingoBoard class
  inherit that super class.  In the super class would be access to a regular matrix and
  its transposed version, as well as maybe some of the logic for testing whether the
  matrix contained certain objects, or whether an entire row or column was the same value.


How can you access coordinates in a nested array?
  To access a nested array you need two sets of brackets.  If we had ary = [[a, b], [5, 6]] 
  and we wanted to get to the 5 in the seconde nested array, we would type ary[1][0]


What methods did you use to access and modify the array?
  #each and #each_with_index were used quite a bit.  I also used #transpose and #all?. The first two
  were used just to iterate through items.


Give an example of a new method you learned while reviewing the Ruby docs. Based on what you
see in the docs, what purpose does it serve, and how is it called?
  #all? is a great way to test to see if all of the elements of an array are the same. 
  #transpose allowed me to flip the array around (pivot it) in some cases to make checking
  for matches by iterating through the array easier.  I could have used it more, but decided
  that it was probably a resource hog and rather slow, so in some cases I stuck with working
  on the matrix as is.


How did you determine what should be an instance variable versus a local variable?
  Those variables which were going to be used often across many different methods I choose
  to make class or instance variables to avoid having to pass around data between methods all
  of the time.  All no method takes outside data, meaning that an end user can't change the
  behavior of the program - which means that it will always function as predicted since no weird
  data can be passed into it.  The exception is the initialize method: someone could pass in
  an invalid array which could cause the program to fail.  If I had more time I would implement
  measures to prevent that.


What do you feel is most improved in your refactored solution?
  I made a good first pass at making somethings more DRY and trying to move things to class variables
  and constants at the outset to provide an easy way to modify the behavior or output of the program.
  I could certainly have taken it further and look forward to feedback about ways to do that.  I implemented
  some more convenience methods, but I did not go hogwild doing that since I am not sure it would improve
  readability or performance in most cases.  I did "complete" the program so that it can play a complete
  game through to the finish and wrote driver code to let it play out an entire game.
=end
