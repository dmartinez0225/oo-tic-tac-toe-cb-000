class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

      WIN_COMBINATIONS=[
        [0, 1, 2], #top row
        [3, 4, 5], #middle row
        [6, 7, 8], #bottom row
        [0, 3, 6], #first column
        [1, 4, 7], #middle column
        [2, 5, 8], #last column
        [0, 4, 8], #diagonal 1
        [2, 4, 6], #diagonal 2
      ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = (user_input.to_i) - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end

  def turn_count
    turns = 0
    @board.each do |token|
      if token == "X" || token == "O"
      turns +=1
    end
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter a number between 1-9:"
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      puts "Great move!"
      move(index, token)
      display_board
    else
        puts "Invalid move! Choose a number between 1 - 9 or a spot that has not yet been taken"
          turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
      if @board[winner[0]] == @board[winner[1]] && @board[winner[1]] == @board[winner[2]] && position_taken?(winner[0])
        true
      else
        false
      end
    end
  end

  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  def draw?
    !(won?) && full?
  end

  def over?
    draw? || full?|| won?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end


  def play
    until over?
      turn
      end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
