require_relative 'boardSpace.rb'
class Board
  attr_accessor :root
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

  def find(row,col)
    current = @root
    while !((row == current.row) && (col == current.column))
      current = current.next
    end

    return current
    
  end

  def move(startSpace,stopSpace)
    start = find(startSpace.row,startSpace.column)
    stop = find(stopSpace.row, stopSpace.column)
    stop.setPiece(start.piece)
    start.setPiece(nil)
  end
end