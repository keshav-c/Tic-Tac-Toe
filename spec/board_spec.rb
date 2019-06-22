require './lib/board'

describe Board do

    context "#move_valid?" do
        before {@board = Board.new}
        it "returns true when move is 1" do
            expect(@board.move_valid?("1")).to eql(true)
        end
        it "returns false when move to 7 and 7 is occupied" do
            @board.pos = ["1", "2", "3", "4", "X", "6", "O", "8", "9"]
            expect(@board.move_valid?("7")).to eql(false)
        end
        it "returns false when move is 0" do
            expect(@board.move_valid?("0")).to eql(false)
        end
        it "returns false when move is a" do
            expect(@board.move_valid?("a")).to eql(false)
        end
    end

    context "#update" do
        it "changes the mark at the position 5 to X" do
            board = Board.new
            board.update("5", "X")
            expect(board.pos).to eql ["1", "2", "3", "4", "X", "6", "7", "8", "9"]
        end
        it "changes the mark at the position 9 to 0" do
            board = Board.new
            board.update("9", "O")
            expect(board.pos).to eql ["1", "2", "3", "4", "5", "6", "7", "8", "O"]
        end
        it "doesn't change anything when asked to chage 10 to X" do
            board = Board.new
            board.update("10", "X")
            expect(board.pos).to eql ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        end
    end

    context "#tie?" do
        before {@board = Board.new}
        it "recognizes XXO;OOX;XOX as a tie" do
            @board.pos = "XXOOOXXOX".split("")
            expect(@board.tie?).to eql(true)
        end
        it "recognizes OXO;XOX;XOX as a tie" do
            @board.pos = "OXOXOXXOX".split("")
            expect(@board.tie?).to eql(true)
        end
        it "doesn't recognize XXX;XOX;XOX as a tie" do
            @board.pos = "XXXXOXXOX".split("")
            expect(@board.tie?).to eql(false)
        end
        it "doesn't recognize OXO;XOX;OXO as a tie" do
            @board.pos = "OXOXOXOXO".split("")
            expect(@board.tie?).to eql(false)
        end
    end

    context "#victory" do
        before {@board = Board.new}
        it "123;OOX;XOX is not a victory, returned nil" do
            @board.pos = "123OOXXOX".split("")
            expect(@board.victory).to eql(nil)
        end
        it "OXO;XXX;XOX as a victory for X" do
            @board.pos = "OXOXXXXOX".split("")
            expect(@board.victory).to eql("X")
        end
        it "OOO;XOX;XOX as a victory for O" do
            @board.pos = "OOOXOXXOX".split("")
            expect(@board.victory).to eql("O")
        end
        it "OXO;XOX;OXO is a victory for O" do
            @board.pos = "OXOXOXOXO".split("")
            expect(@board.victory).to eql("O")
        end
    end
end