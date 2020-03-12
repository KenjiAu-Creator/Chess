require_relative 'boardSpace.rb'
class Board
  def initialize
    @root = BoardSpace.new(0,0)
    currentSpace = @root
    for i in 1..8
      for j in 1..8
        newSpace = BoardSpace.new(i,j)
        currentSpace.link(newSpace)
        currentSpace = newSpace
      end
    end
  end
    
  def size
    currentSpace = @root.next
    count = 0
    while !currentSpace.nil?
      count += 1
      currentSpace = currentSpace.next
    end
    return count
  end
end