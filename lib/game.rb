class Game

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    move_number = board.turn_count
    if move_number == 0 || move_number == 2 || move_number == 4 || move_number == 6 || move_number == 8
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    x_index = []
    y_index = []
    board.cells.each_with_index do |value, index|
      x_index << index if value == "X"
      y_index << index if value == "O"
    end
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|element| x_index.include?(element)} || win_combination.all?{|element| y_index.include?(element)}
        return win_combination
      end
    end
    return false if board.full?
  end

  def draw?
    if won? == false && board.full? == true
      true
    else
      false
    end
  end

  def over?
    if draw? == true
      true
    elsif won? != nil
      true
    else
      false
    end
  end

  def winner
    if won?
      if current_player.token == "X"
          "O"
        else
          "X"
      end
    else
      return nil
    end
  end

  def turn
    input = self.current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
      current_player
    else
      puts "Move is not valid."
      turn
    end
  end

  def new_game?
    puts "Enter 1 to play another game."
    puts "Enter Q to quit game."
    input = gets.chomp

    if input == "1"
      game = Game.new
      game.start
    elsif input.downcase == "q"
      puts "Thanks for playing.... Goodbye!"
    else
      puts "Invalid Selection!"
      new_game?
    end
  end

  def play_multiple
    latest_result = over?
    until latest_result == true
      self.turn
      latest_result = over?
    end
    if draw?
      p "Cat's Game!"
    elsif won? != nil
      p "Congratulations #{winner}!"
    end
  end

  def play
    latest_result = over?
    until latest_result == true
      self.turn
      latest_result = over?
    end
    if draw?
      puts "Cat's Game!"
      new_game?
    elsif won? != nil
      puts "Congratulations #{winner}!"
      new_game?
    end
  end

  def start
    puts "Welcome to Tic Tac Toe with AI!"
    puts <<-doc
      What type of game would you like to play?
        Enter 0 to play computer vs. computer.
        Enter 1 to play computer vs. Human.
        Enter 2 to play Human vs. Human.
      doc
      input = gets.chomp
      if input == "0"
        self.player_1 = Players::Computer.new("X")
        self.player_2 = Players::Computer.new("O")
        self.play
      elsif input == "1"
        input = nil
        while input == nil
        puts "Enter 1 for computer to go first or 2 for Human to go first:"
        input = gets.chomp
          if input == "1"
            self.player_1 = Players::Computer.new("X")
            self.player_2 = Players::Human.new("O")
            self.play
          elsif input == "2"
            self.player_1 = Players::Human.new("X")
            self.player_2 = Players::Computer.new("O")
            self.play
          else
            input = nil
            puts "Invalid Input"
          end
        end
      elsif input == "2"
        self.play
      else
        puts "Invalid input!"
        start
      end
  end
end
