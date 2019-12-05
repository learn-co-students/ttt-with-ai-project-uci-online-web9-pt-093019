class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts("------------")
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts("------------")
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    self.cells[input.to_i-1]
  end

  def full?
    self.cells.none?(" ")
  end

  def turn_count
    self.cells.count{|cell| cell != " "}
  end

  def taken?(position)
    self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
  end

  def valid_move?(input)
    if input.to_i.between?(1, 9)
      !taken?(input)
    end
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end
end
