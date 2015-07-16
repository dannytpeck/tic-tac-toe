class Board
  attr_accessor :upper_left, :upper_middle, :upper_right, 
                :middle_left, :middle, :middle_right, 
                :bottom_left, :bottom_middle, :bottom_right
  
  def initialize
    @upper_left    = Square.new
    @upper_middle  = Square.new
    @upper_right   = Square.new
    @middle_left   = Square.new
    @middle        = Square.new
    @middle_right  = Square.new
    @bottom_left   = Square.new
  	@bottom_middle = Square.new
  	@bottom_right  = Square.new
  end

  class Square
  	attr_accessor :result

  	def initialize
  	  @result = " "
  	end

  	def empty?
  	  if result == " "
  	  	true
  	  else
  	  	false
  	  end
  	end
  end

  def draw_board
    print " " + upper_left.result    + " |"
    print " " + upper_middle.result  + " |"
    print " " + upper_right.result
    puts
    puts "-----------"
    print " " + middle_left.result   + " |"
    print " " + middle.result        + " |"
    print " " + middle_right.result
    puts
    puts "-----------"
    print " " + bottom_left.result   + " |"
    print " " + bottom_middle.result + " |"
    print " " + bottom_right.result
    puts
    puts
  end

  def find_square_by_number(number)
  	return upper_left if number == 1
    return upper_middle if number == 2
    return upper_right if number == 3
    return middle_left if number == 4
    return middle if number == 5
    return middle_right if number == 6
    return bottom_left if number == 7
    return bottom_middle if number == 8
    return bottom_right if number == 9
  end

  def take_turn(selection, player_turn)
    find_square_by_number(selection).result = player_turn
  end

  def game_over?
  	player_one_won? || player_two_won?
  end

  def player_one_won?
    player_won?("X")
  end

  def player_two_won?
  	player_won?("O")
  end

  def player_won?(player_turn)
    if upper_left.result == player_turn
      if upper_middle.result == player_turn
      	if upper_right.result == player_turn
      	  return true
      	end
      end
      if middle_left.result == player_turn
      	if bottom_left.result == player_turn
      	  return true
      	end
      end
      if middle.result == player_turn
      	if bottom_right.result == player_turn
      	  return true
      	end
      end
    end
    if upper_middle.result == player_turn
      if middle.result == player_turn
      	if bottom_middle.result == player_turn
      	  return true
      	end
      end
    end
    if upper_right.result == player_turn
      if middle_right.result == player_turn
      	if bottom_right.result == player_turn
      	  return true
      	end
      end
    end
    if middle_left.result == player_turn
      if middle.result == player_turn
      	if middle_right.result == player_turn
      	  return true
      	end
      end
    end
    if bottom_left.result == player_turn
      if bottom_middle.result == player_turn
      	if bottom_right.result == player_turn
      	  return true
      	end
      end
    end
    if upper_right.result == player_turn
      if middle.result == player_turn
      	if bottom_left.result == player_turn
      	  return true
      	end
      end
    end
    false
  end
end

def draw_selections
  puts " 1 | 2 | 3 "
  puts "-----------"
  puts " 4 | 5 | 6 "
  puts "-----------"
  puts " 7 | 8 | 9 "
end

game_board = Board.new
player_turn = "X"
turn_counter = 0

game_loop = true
while game_loop
  game_board.draw_board
  draw_selections
  puts "What move would you like to take, player one?" if player_turn == "X"
  puts "What move would you like to take, player two?" if player_turn == "O"

  selection = gets.chomp

  if selection.to_i < 1 || selection.to_i > 9
  	puts "Input a number between 1 and 9."
  else
  	if game_board.find_square_by_number(selection.to_i).empty?
  	  game_board.take_turn(selection.to_i, player_turn)
      turn_counter += 1
      if game_board.player_one_won?
        game_board.draw_board
        puts "Congratulations, player one! You win!"
        game_loop = false
      elsif game_board.player_two_won?
      	game_board.draw_board
      	puts "Congratulations, player two! You win!"
      	game_loop = false
      elsif turn_counter == 9
      	game_board.draw_board
      	puts "Cats game! No winner!"
      	game_loop = false
      else
        player_turn == "X"? player_turn = "O" : player_turn = "X"
      end
    else
      puts "That square already has an #{game_board.find_square_by_number(selection.to_i).result} in it!"
    end
  end
end