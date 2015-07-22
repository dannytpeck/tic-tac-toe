require './tictactoe'

describe TicTacToe do

  before :each do
    @game = TicTacToe.new
  end

  describe "#new" do
    it "creates a new empty board" do
      game = TicTacToe.new
      game.middle.result.should eql " "
    end
  end

  describe "#player_won?" do
    it "is true if a player has won the game" do
      @game.upper_left.result = "X"
      @game.middle_left.result = "X"
      @game.bottom_left.result = "X"
      @game.player_won?("X").should be_true
    end
    it "is false if a player hasn't won the game" do
      @game.upper_left.result = "O"
      @game.middle.result = "X"
      @game.bottom_right.result = "X"
      @game.player_won?("X").should be_false
    end
  end

  describe "#game_over?" do
    it "is true if a player has won the game" do
      @game.upper_left.result = "O"
      @game.middle_left.result = "O"
      @game.bottom_left.result = "O"
      @game.game_over?.should be_true
    end
    it "is false if neither player has won the game" do
      @game.upper_left.result = "X"
      @game.bottom_right.result = "O"
      @game.game_over?.should be_false
    end
  end

end




