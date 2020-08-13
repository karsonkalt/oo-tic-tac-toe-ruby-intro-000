class ConnectFour
  def initialize(board = Array.new(42, " "))
     @board = board
  end

  COLUMN_1 = [0, 6, 12, 18, 24, 30, 36]
  COLUMN_2 = [1, 7, 13, 19, 25, 31, 37]
  COLUMN_3 = [2, 8, 14, 20, 26, 32, 38]
  COLUMN_4 = [3, 9, 15, 21, 27, 33, 39]
  COLUMN_5 = [4, 10, 13, 22, 28, 34, 40]
  COLUMN_6 = [5, 11, 14, 23, 29, 35, 41]

  WIN_COMBINATIONS = [
    #ROWS
    #ROW 1
    [0, 1, 2, 3],
    [1, 2, 3, 4],
    [2, 3, 4, 5],
    #ROW 2
    [6, 7, 8, 9],
    [7, 8, 9, 10],
    [8, 9, 10, 11],
    #ROW 3
    [12, 13, 14, 15],
    [13, 14, 15, 16],
    [14, 15, 16, 17],
    #ROW 4
    [18, 19, 20, 21],
    [19, 20, 21, 22],
    [20, 21, 22, 23],
    #ROW 5
    [24, 25, 26, 27],
    [25, 26, 27, 28],
    [26, 27, 28, 29],
    #ROW 6
    [30, 31, 32, 33],
    [31, 32, 33, 34],
    [32, 33, 34, 35],
    #ROW 7
    [36, 37, 38, 39],
    [37, 38, 39, 40],
    [38, 39, 40, 41],
    #COLUMNS
    #COLUMN 1
    [0, 6, 12, 18],
    [6, 12, 18, 24],
    [12, 18, 24, 30],
    [18, 24, 30, 36],
    #COLUMN 2
    [1, 7, 13, 19],
    [7, 13, 19, 25],
    [13, 19, 25, 31],
    [19, 25, 31, 37],
    #COLUMN 3
    [2, 8, 14, 20],
    [8, 14, 20, 26],
    [14, 20, 26, 32],
    [20, 26, 32, 38],
    #COLUMN 4
    [3, 9, 15, 21],
    [9, 15, 21, 27],
    [15, 21, 27, 33],
    [21, 27, 33, 39],
    #COLUMN 5
    [4, 10, 16, 22],
    [10, 16, 22, 28],
    [16, 22, 28, 34],
    [22, 28, 34, 40],
    #COLUMN 6
    [5, 11, 17, 23],
    [11, 17, 23, 29],
    [17, 23, 29, 35],
    [23, 29, 35, 41],
    #DIAGONALS
    #DIAGONAL TO BOTTOM RIGHT
    [2, 9, 16, 23],
    [1, 8, 15, 22],
    [8, 15, 22, 29],
    [0, 7, 14, 21],
    [7, 14, 21, 28],
    [14, 21, 28, 35],
    [6, 13, 20, 27],
    [13, 20, 27, 34],
    [20, 27, 34, 41],
    [12, 19, 26, 33],
    [19, 26, 33, 40],
    [18, 25, 32, 39],
    #DIAGONAL TO TOP RIGHT
    [3, 8, 13, 18],
    [4, 9, 14, 19],
    [9, 14, 19, 24],
    [5, 10, 15, 20],
    [10, 15, 20, 25],
    [15, 20, 25, 30],
    [11, 16, 21, 26],
    [16, 21, 26, 31],
    [21, 26, 31, 36],
    [17, 22, 27, 32],
    [22, 27, 32, 37],
    [23, 28, 33, 38]
  ]

  #HELPER METHODS
  def display_board
    puts ""
    puts ""
    puts "| 1 | 2 | 3 | 4 | 5 | 6 |"
    puts "|---|---|---|---|---|---|"
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} | #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} | #{@board[9]} | #{@board[10]} | #{@board[11]} |"
    puts "| #{@board[12]} | #{@board[13]} | #{@board[14]} | #{@board[15]} | #{@board[16]} | #{@board[17]} |"
    puts "| #{@board[18]} | #{@board[19]} | #{@board[20]} | #{@board[21]} | #{@board[22]} | #{@board[23]} |"
    puts "| #{@board[24]} | #{@board[25]} | #{@board[26]} | #{@board[27]} | #{@board[28]} | #{@board[29]} |"
    puts "| #{@board[30]} | #{@board[31]} | #{@board[32]} | #{@board[33]} | #{@board[34]} | #{@board[35]} |"
    puts "| #{@board[36]} | #{@board[37]} | #{@board[38]} | #{@board[39]} | #{@board[40]} | #{@board[41]} |"
    puts ""
    puts""
  end

def move(column, token)
  @board[column_to_index(column)] = token
end

def column_to_index(column)
  if column == 1
    empty_spaces_in_column = COLUMN_1.select{ |i| (@board[i] == " ") || (@board[i] == "") || (@board[i] == nil)}
    return COLUMN_1[empty_spaces_in_column.length - 1]
  elsif column == 2
    empty_spaces_in_column = COLUMN_2.select{ |i| (@board[i] == " ") || (@board[i] == "") || (@board[i] == nil)}
    return COLUMN_2[empty_spaces_in_column.length - 1]
  elsif column == 3
    empty_spaces_in_column = COLUMN_3.select{ |i| (@board[i] == " ") || (@board[i] == "") || (@board[i] == nil)}
    return COLUMN_3[empty_spaces_in_column.length - 1]
  elsif column == 4
    empty_spaces_in_column = COLUMN_4.select{ |i| (@board[i] == " ") || (@board[i] == "") || (@board[i] == nil)}
    return COLUMN_4[empty_spaces_in_column.length - 1]
  elsif column == 5
    empty_spaces_in_column = COLUMN_5.select{ |i| (@board[i] == " ") || (@board[i] == "") || (@board[i] == nil)}
    return COLUMN_5[empty_spaces_in_column.length - 1]
  elsif column == 6
    empty_spaces_in_column = COLUMN_6.select{ |i| (@board[i] == " ") || (@board[i] == "") || (@board[i] == nil)}
    return COLUMN_6[empty_spaces_in_column.length - 1]
  end
end

  def position_taken?(column)
    if @board[column_to_index(column)] == "" || @board[column_to_index(column)] == " " || @board[column_to_index(column)] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(column)
    if column >= 1 && column <= 6
      if position_taken?(column) == false
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn
    token = current_player
    puts "--------------"
    puts "   #{token}'S TURN  "
    puts "--------------"
    puts "Please choose a column to drop your token."
    column = gets.chomp.to_i
    if valid_move?(column) == true
      move(column, token)
      display_board
    else
      puts "This is not a valid move."
      turn
    end
  end


  def turn_count
    moves_made = @board.select do |i|
      i == "X" || i =="O"
    end
    return moves_made.length
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |i|
      @board[i[0]] == @board[i[1]] &&
      @board[i[1]] == @board[i[2]] &&
      @board[i[2]] == @board[i[3]] &&
      @board[i[0]] != " "
    end
  end

  def full?
    if turn_count >= 42
      return true
    else
      return false
    end
  end

  def draw?
    if !won? && full? == true
      return true
    else
      return false
    end
  end

  def over?
    if !won? == false || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def winner
    if won?.class == Array
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    puts "-----------------------------------------------"
    puts "Do you want to play against the computer? (Y/N)"
    puts "-----------------------------------------------"
    computer_game = gets.chomp
    if computer_game == "N"
      display_board
      until over? == true
        turn
      end

      if !won? == false
        puts "-------------------"
        puts "  CONGRATULATIONS  "
        puts "-------------------"
        puts "  #{winner} WON THE GAME!  "
        puts "-------------------"
      elsif draw?
        puts "-----------------------"
        puts "IT'S A DRAW, NOBODY WON"
        puts "-----------------------"
      end
  elsif computer_game == "Y"
    puts "Do you want to play against the computer?"
  else
    puts "Invalid response."
    play
  end
end
end
