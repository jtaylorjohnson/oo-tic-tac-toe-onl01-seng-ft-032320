class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    #why pipes
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [5,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    index = string.to_i - 1 
    index
  end
    
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    if @board[index] == "X" or "O"
      return true 
    else 
      return false 
    end
  end
   
  def valid_move?(index)
    if position_taken?(index) == false && [index < 9 || index > -1]
    then 
      return true 
    else 
      return false
    end
  end
  
  def turn 
    puts "Please choose a number 1-9:"
    move = gets.chomp
    index = input_to_index(move)
    if valid_move?(index) == true 
      token = current_player 
      move(index, token)
      display_board
    else
      turn
    end
  end  
  
  #does this work?
  def turn_count
    precount = @board.count(" ")
    count = 9 - precount
    count
  end
  
  #does this work?
  def current_player
    turns = turn_count
    if turns % 2 == 0  
      then "X"
    else "O"
    end
  end
  
  def won?
    # WIN_COMBINATIONS.any? { |n| n==@board }
    # @board
    WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
  end
  
  def full?
    @board.all? { |n| n == "X" || n == "O"}
  end
  
  def draw?
    if full? == true && won? == false 
      return true
    else 
      return false
    end 
  end
  
  def over?
    if won? || draw?
      return true
    else 
      return false
    end
  end
  
  def winner
    x = @board.count("X")
    o = @board.count("O")
    if x > o 
      return "X"
    else 
      return "O"
    end
  end
  
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}"
    elsif draw?
    puts "Cats Game!"
    end
  end
    

end