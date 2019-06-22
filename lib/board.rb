class Board
    attr_accessor :pos
    
    def initialize
        @pos = ("1".."9").to_a
	end

    def display
        str_pos = pos.map { |i| i.center(5) }
        row1 = "|#{str_pos[0]}|#{str_pos[1]}|#{str_pos[2]}|"
        row2 = "|#{str_pos[3]}|#{str_pos[4]}|#{str_pos[5]}|"
        row3 = "|#{str_pos[6]}|#{str_pos[7]}|#{str_pos[8]}|"
        sep = "------+-----+------"
        puts "#{sep}\n#{row1}\n#{sep}\n#{row2}\n#{sep}\n#{row3}\n#{sep}"
    end

    def move_valid?(move)
        correct_pos = ("1".."9").include?(move)
        if correct_pos
            is_not_occupied = pos[move.to_i - 1].eql?(move)
        end
        correct_pos and is_not_occupied
    end

    def update(position, sym)
        pos[position.to_i - 1] = sym if move_valid? position
    end

    def tie?
        board_full = pos.none? { |i| ("1".."9").include? i }
        if board_full and victory.nil?
            return true
        else
            return false
        end
    end

    def victory
        if pos[0].eql? pos[1] and pos[1].eql? pos[2]
            return pos[0]
        elsif pos[3].eql? pos[4] and pos[4].eql? pos[5]
            return pos[3]
        elsif pos[6].eql? pos[7] and pos[7].eql? pos[8]
            return pos[6]
        elsif pos[0].eql? pos[3] and pos[3].eql? pos[6]
            return pos[0]
        elsif pos[1].eql? pos[4] and pos[4].eql? pos[7]
            return pos[1]
        elsif pos[2].eql? pos[5] and pos[5].eql? pos[8]
            return pos[2]
        elsif pos[0].eql? pos[4] and pos[4].eql? pos[8]
            return pos[0]
        elsif pos[2].eql? pos[4] and pos[4].eql? pos[6]
            return pos[2]
        else
            return nil
        end
    end
end


# b = Board.new
# b.display
# m = gets.chomp
# p b.move_valid?(m)