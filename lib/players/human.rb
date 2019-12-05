module Players
  class Human < Player

    def move(board = nil)
      puts "Enter position 1-9 for your move:"
      input = gets.strip
    end
  end
end
