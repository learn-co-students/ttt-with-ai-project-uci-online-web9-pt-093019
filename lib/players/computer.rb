module Players

  class Computer < Player

    def move_old(board = nil)
      if board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[4] == " "
        "5"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      end
    end

    def move(board = nil)
      if current_count(board) == 0
        rand(1..9)
      elsif current_count(board) == 1
        if current_board(board).include?(4)
          move_old(board)
        else
          "5"
        end
      else
        complex_move(board)
      end
    end

    def current_count (board = nil)
      board.cells.count{|cell| cell != " "}
    end

    def current_board (board = nil)
      current_positions = []
      board.cells.each.with_index do |element, index|
        if element != " "
          current_positions << index
        end
      end
      current_positions
    end

    def complex_move(board)
      board_array = current_board(board)
      if board.cells[0] != " " && board.cells[0] == board.cells[4] && board.cells[8] == " "
        "9"
      elsif board.cells[0] != " " && board.cells[0] == board.cells[8] && board.cells[2] == " "
        "3"
      elsif board.cells[0] != " " && board.cells[0] == board.cells[8] && board.cells[6] == " "
        "7"
      elsif board.cells[0] != " " && board.cells[0] == board.cells[1] && board.cells[2] == " "
        "3"
      elsif board.cells[0] != " " && board.cells[0] == board.cells[3] && board.cells[6] == " "
        "7"
      elsif board.cells[0] != " " && board.cells[0] == board.cells[2] && board.cells[1] == " "
        "2"
      elsif board.cells[0] != " " && board.cells[0] == board.cells[6] && board.cells[3] == " "
        "4"

      elsif board.cells[1] != " " && board.cells[1] == board.cells[2] && board.cells[0] == " "
        "1"
      elsif board.cells[1] != " " && board.cells[1] == board.cells[4] && board.cells[7] == " "
        "8"

      elsif board.cells[2] != " " && board.cells[2] == board.cells[4] && board.cells[6] == " "
        "7"
      elsif board.cells[2] != " " && board.cells[2] == board.cells[6] && board.cells[0] == " "
        "1"
      elsif board.cells[2] != " " && board.cells[2] == board.cells[6] && board.cells[8] == " "
        "9"
      elsif board.cells[2] != " " && board.cells[2] == board.cells[5] && board.cells[8] == " "
        "9"
      elsif board.cells[2] != " " && board.cells[2] == board.cells[8] && board.cells[5] == " "
        "6"

      elsif board.cells[3] != " " && board.cells[3] == board.cells[4] && board.cells[5] == " "
        "6"
      elsif board.cells[3] != " " && board.cells[3] == board.cells[6] && board.cells[0] == " "
        "1"

      elsif board.cells[5] != " " && board.cells[5] == board.cells[4] && board.cells[3] == " "
        "4"
      elsif board.cells[5] != " " && board.cells[5] == board.cells[8] && board.cells[2] == " "
        "3"

      elsif board.cells[6] != " " && board.cells[6] == board.cells[4] && board.cells[2] == " "
        "3"
      elsif board.cells[6] != " " && board.cells[6] == board.cells[7] && board.cells[8] == " "
        "9"
      elsif board.cells[6] != " " && board.cells[6] == board.cells[8] && board.cells[7] == " "
        "8"

      elsif board.cells[7] != " " && board.cells[7] == board.cells[4] && board.cells[1] == " "
        "2"
      elsif board.cells[7] != " " && board.cells[7] == board.cells[8] && board.cells[6] == " "
        "7"

      elsif board.cells[8] != " " && board.cells[8] == board.cells[4] && board.cells[0] == " "
        "1"
      else
      move_old(board)
      end
    end
  end
end
