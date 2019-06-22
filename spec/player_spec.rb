require './lib/player'
require './lib/board'

describe Player do
    before {@valid_move = Player.new("abc", "X").make_move?("#{pos}", Board.new)}

    describe "#move_valid?" do
        context "3 on the board" do
            let(:pos) {"3"}
            it "3 is a valid spot on the board" do
                expect(@valid_move).to eql(true)
            end
        end
        context "8 on the board" do
            let(:pos) {"8"}
            it "8 is a valid spot on the board" do
                expect(@valid_move).to eql(true)
            end
        end
        context "X on the board" do
            let(:pos) {"X"}
            it "X is not a valid spot on the board" do
                expect(@valid_move).to eql(false)
            end
        end
        context "\\n on the board" do
            let(:pos) {"\n"}
            it "\\n is not a valid spot on the board" do
                expect(@valid_move).to eql(false)
            end
        end
    end
end