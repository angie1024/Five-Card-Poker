class Array

  def my_uniq
    uniq_items = []

    self.each do |el|
      uniq_items << el unless uniq_items.include?(el)
    end

    uniq_items
  end

  def two_sum
    indices = []
    self.length.times do |idx1|
      ((idx1 + 1)...self.length).each do |idx2|
        indices << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    indices
  end

  def my_stock_picker
    best_pair = []
    self.length.times do |i|
      ((i + 1)...self.length).each do |j|
        if best_pair.empty? || (self[j] - self[i] > self[best_pair[1]] - self[best_pair[0]])
          best_pair = []
          best_pair << i
          best_pair << j
        end
      end
    end
    best_pair
  end
end

def my_transpose(array)
  dimension = array.first.count

  transposed = Array.new(dimension){ Array.new(dimension) }

  dimension.times do |i|
    dimension.times do |j|
      transposed[j][i] = array[i][j]
    end
  end

  transposed
end
