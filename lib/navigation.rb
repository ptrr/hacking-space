class Navigation
  attr_reader :prev, :next
  def initialize(current = 'home')
    @hierarchy = %w(home about blog projects contact)
    @prev = find_previous current
    @next = find_next current
  end

  def find_next current
    index = @hierarchy.index(current).to_i
    if index >= @hierarchy.count - 1
      return 
    else
      return @hierarchy[index + 1]
    end
    # ((index + 1) >= @hierarchy.count) ? nil : @hierarchy[index + 1]  
  end

  def find_previous current
    index = @hierarchy.index(current).to_i
    if index <= 0
      return nil
    else
      return @hierarchy[index - 1]
    end
    # (index < 0) ? nil : @hierarchy[index - 1]  
  end
end