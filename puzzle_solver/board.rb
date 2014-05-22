class Board
  attr_accessor :blank_space, :matrix, :swap_history, :score

  def initialize(m, sh = [])
    # set up the matrix
    # by duplicating the contents of m
    
    @size = m.length

    @swap_history = sh.dup

    @matrix = []
    m.each_with_index do |row,i|
      @matrix[i] = row.dup
    end

    calculate_score! unless defined? @score

    # get coordinates of blank space location
    @blank_space = find_blank_space
  end

  def swap!(swap)
    pos1 = swap[0]
    pos2 = swap[1]
    name = swap[2]

    tmp = @matrix[pos1[0]][pos1[1]]
    @matrix[pos1[0]][pos1[1]] = @matrix[pos2[0]][pos2[1]]
    @matrix[pos2[0]][pos2[1]] = tmp

    remember_swap(name)
    @blank_space = find_blank_space
    calculate_score!
  end

  def remember_swap(name)
    @swap_history << name
  end

  def last_swap
    @swap_history.last
  end

  def print_swap_history
    str = ""
    @swap_history.each do |move|
      str << move.to_s
      str << ","
    end
    puts str

    puts "steps: #{@swap_history.length}"
  end

  def get_valid_swaps
    valid_swaps = []

    b_row = @blank_space[0]
    b_row_p1 = b_row + 1
    b_row_m1 = b_row - 1
    b_col = @blank_space[1]
    b_col_p1 = b_col + 1
    b_col_m1 = b_col - 1

    # up swap
    up_tile = [b_row_m1, b_col]

    if is_valid_tile?(up_tile) and @swap_history.last != :down
      valid_swaps << [@blank_space, up_tile, :up] 
    end

    # down swap
    down_tile = [b_row_p1, b_col]
    
    if is_valid_tile?(down_tile) and @swap_history.last != :up
      valid_swaps << [@blank_space, down_tile, :down]
    end

    # left swap
    left_tile = [b_row, b_col_m1]

    if is_valid_tile?(left_tile) and @swap_history.last != :right
      valid_swaps << [@blank_space, left_tile, :left]
    end

    # right swap
    right_tile = [b_row, b_col_p1]

    if is_valid_tile?(right_tile) and @swap_history.last != :left
      valid_swaps << [@blank_space, right_tile, :right]
    end

    return valid_swaps
  end

  def is_solved?
    target_val = 1
    @matrix.each_with_index do |row,i|
      row.each_with_index do |val,j|
        if i == @size - 1 and j == @size - 1
          return false if val != nil
        else
          if val != target_val
            return false
          end
          target_val += 1
        end
      end
    end
    return true
  end


  def to_s
    str = ""

    @matrix.each do |row|
      str << "["
      row.each_with_index do |item,index|
        str << item.to_s
        str << "nil" if item == nil
        str << "," unless index == row.length - 1
      end
      str << "]\n"
    end
      str << "\n"

    return str
  end

  private

  def diagonal_shortcut(current_x, target_x, current_y, target_y)
    x_distance = (current_x - target_x).abs
    y_distance = (current_y - target_y).abs

    if x_distance > y_distance
      h = 14 * y_distance + 10*(x_distance - y_distance)
    else
      h = 14 * x_distance + 10*(y_distance - x_distance)
    end

    return h
  end

  # slower alternative heuristic
  def manhattan_method(current_x, target_x, current_y, target_y)
    h = 10 * ((current_x - target_x).abs + (current_y - target_y).abs)
  end

  def calculate_score!
    score = 0

    @matrix.each_with_index do |row,i|
      row.each_with_index do |val,j|
        # get target location
        if val == nil
          target_row = @size - 1
          target_col = @matrix[@size-1].length - 1
        else
          target_col = (val - 1) % @size
          target_row = ((val - 1).fdiv(@size)).floor
        end

        score += diagonal_shortcut(i,target_row,j,target_col)
      end
    end

    @score = score
  end

  def is_valid_tile?(tile)
    x = tile[0]
    y = tile[1]

    if x < 0 or y < 0 or x > @size - 1 or y > @size - 1
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