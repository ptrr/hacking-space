class Navigation
  attr_accessor :prev, :next, :current
  HIERARCHY = %w[home about blog projects contact]
  def initialize(current)
    # raise HIERARCHY.inspect
    @current = current
    @prev = find_previous current.to_s
    @next = find_next current.to_s

    # raise HIERARCHY[3] + HIERARCHY.index(@next).to_s
  end

  def find_next current
    index = HIERARCHY.rindex(current).to_i
    if index > HIERARCHY.count
      return nil
    else
      return HIERARCHY[index + 1]
    end
  end

  def find_previous current
    index = HIERARCHY.rindex(current).to_i
    if index <= 0
      return nil
    else
      return HIERARCHY[index - 1]
    end
  end
end