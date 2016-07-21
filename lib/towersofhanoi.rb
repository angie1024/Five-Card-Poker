class TowersOfHanoi
  attr_accessor :board

  def initialize
    @board = [[3,2,1],[],[]]
  end

  def get_input
    puts "Enter position to take from."
    start_pos = gets.chomp
    puts "enter position to move to."
    end_pos = gets.chomp
  end

  def move(start_pos, end_pos)
    raise "Can't move larger to smaller piece." if error?(start_pos, end_pos)
    board[end_pos].push(board[start_pos].pop)
  end

  def error?(start_pos, end_pos)
    board[start_pos].last > board[end_pos].last
  end

  def won?
    @board[0].empty? && (@board[1] == [3,2,1] || @board[2] == [3,2,1])
  end
end
