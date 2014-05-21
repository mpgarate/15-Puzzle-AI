# referenced:
# https://gist.github.com/aspyct/3428688

class MinHeap
  def initialize
    @nodes = []
  end

  def empty?
    @nodes.count == 0
  end

  def pop_min
    val = @nodes[0].first
    pair = @nodes.pop

    if @nodes.count > 0
      @nodes[0] = pair
      self.bubble_down pair, 0
    end

    return val
  end

  def push(obj,val)
    pair = [obj,val]
    offset = @nodes.count
    @nodes << pair

    self.bubble_up pair, offset
  end

  def bubble_up(pair, offset)
    parent = offset / 2

    while (offset > 0 && @nodes[parent].last > pair.last)
      @nodes[parent], @nodes[offset] = @nodes[offset], @nodes[parent]

      offset = parent
      parent = offset / 2
    end
  end

  def bubble_down(pair, offset)
    while (offset < @nodes.count / 2)
      offset_a = offset * 2
      offset_b = offset_a + 1

      if @nodes[offset_a].last > @nodes[offset_b].last
        smallest = offset_b
      else
        smallest = offset_a
      end

      if pair.last <= @nodes[smallest].last
        break
      end

      @nodes[offset], @nodes[smallest]  = @nodes[smallest], @nodes[offset]
      offset = smallest
    end
  end
end