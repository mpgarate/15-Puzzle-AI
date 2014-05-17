class Board
  def initialize(m)
    # set up the matrix
    # by duplicating the contents of m
    @matrix = []
    m.each_with_index do |row,i|
      @matrix[i] = row.dup
    end
  end

end