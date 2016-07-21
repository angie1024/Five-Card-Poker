require 'rspec'
require 'towersofhanoi'

describe TowersOfHanoi do
  let(:towergame) { TowersOfHanoi.new }

  describe "#initialize" do
    it "creates three arrays" do
      expect(towergame.board).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    it "won't let you move larger piece to smaller" do
      towergame.board = [[3,2],[1],[]]
      expect { towergame.move(0,1) }.to raise_error "Can't move larger to smaller piece."
    end
  end

  describe "#won?" do
    it "lets you know if you won!" do
      towergame.board = [[],[3,2,1],[]]
      expect(towergame.won?).to eq(true)
    end

    it "lets you know if you won!" do
      towergame.board = [[],[],[3,2,1]]
      expect(towergame.won?).to eq(true)
    end
  end
end
