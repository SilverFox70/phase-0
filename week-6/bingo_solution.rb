# A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent [#] hours on this challenge.


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

#Reflection

