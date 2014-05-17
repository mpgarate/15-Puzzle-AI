class Board
  attr_accessor :blank_space, :matrix

  def initialize(m)
    # set up the matrix
    # by duplicating the contents of m
    
    @size = m.length

    @matrix = []
    m.each_with_index do |row,i|
      @matrix[i] = row.dup
    end

    # get coordinates of blank space location
    @blank_space = find_blank_space
  end

  def swap!(pos1,pos2)
    tmp = @matrix[pos1[0],pos1[1]]
    @matrix[pos1[0],pos1[1]] = @matrix[pos2[0],pos2[1]]
    @matrix[pos2[0],pos2[1]] = tmp
  end

  def get_valid_swaps
    valid_swaps = []

    b_col = @blank_space[0]
    b_col_p1 = b_col + 1
    b_col_m1 = b_col - 1
    b_row = @blank_space[1]
    b_row_p1 = b_row + 1
    b_row_m1 = b_row - 1

    # up swap
    up_tile = [b_row_p1, b_col]
    valid_swaps << [@blank_space,up_tile] if is_valid_tile?(up_tile)

    # down swap
    down_tile = [b_row_m1, b_col]
    valid_swaps << [@blank_space, down_tile] if is_valid_tile?(down_tile)

    # left swap
    left_tile = [b_row, b_col_m1]
    valid_swaps << [@blank_space, left_tile] if is_valid_tile?(left_tile)

    # right swap
    right_tile = [b_row, b_col_p1]
    valid_swaps << [@blank_space, right_tile] if is_valid_tile?(right_tile)

    return valid_swaps
  end

  def is_solved?
    target_val = 1
    @matrix.each_with_index do |row,i|
      row.each_with_index do |val,j|
        if i == @size - 1 and j == @size - 1
          return fale if val != nil
        else
          return false if val != target_val
          target_val += 1
        end
      end
    end
    return true
  end

  private

  def is_valid_tile?(tile)
    x = tile[0]
    y = tile[1]

    if x < 0 or y < 0 or x > @size or y > @size
      return false
    else
      return true
    end
  end

  def find_blank_space
    @matrix.each_with_index do |row,i|
      row.each_with_index do |item,j|
        if item == nil
          return [i,j]
        end
      end
    end
  end

end