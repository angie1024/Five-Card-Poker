require 'rspec'
require 'tdd'

describe Array do
  describe "#my_uniq" do
    it "removes duplicates from an array" do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it "finds all pair positions that sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "converts rows to columns" do
      rows = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
      ]
      cols = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ]
      expect(my_transpose(rows)).to eq(cols)
    end
  end

  describe "#my_stock_picker" do
    it "outputs the most profitable pair of days" do
      stock_prices = [6,5,2,7,9]
      expect(stock_prices.my_stock_picker).to eq([2,4])
    end

    it "doesn't sell before buying" do
      stock_prices = [65,3,7,1,12]
      expect(stock_prices.my_stock_picker).to eq([3,4])
    end
  end

end
