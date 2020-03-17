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
    if validMove(startSpace, stopSpace)
      start = find(startSpace.row, startSpace.column)
      stop = find(stopSpace.row, stopSpace.column)
      
      stop.setPiece(start.piece)
      stop.piece.resetMoves
      stop.piece.updatePosition(stop.row, stop.column)
      stop.piece.possibleMoves
      
      start.setPiece(nil)
    else
      puts "Invalid move"
      return false
    end
  end

  def validMove(startSpace, stopSpace)
    iML = inMoveList?(startSpace, stopSpace)
    if sameSpace?(startSpace, stopSpace)
      return false
    elsif !iML[0]
      return false
    elsif collision?(startSpace, stopSpace)
      return false
    elsif blocked?(startSpace, iML[1])
      return false
    else
      return true
    end
  end
  
  def sameSpace?(startSpace, stopSpace)
    if startSpace == stopSpace
      return true
    else
      return false
    end
  end

  def inMoveList?(startSpace, stopSpace)
    row = stopSpace.row
    column = stopSpace.column
    count = 0
    piece.listMoves.each do |boardSpace|
      startRow = boardSpace[0]
      startCol = boardSpace[1]

      if startRow == row && startCol == column
        return [true, count]
      end
      count += 1
    end
    return false    
  end

  def collision?(startSpace, stopSpace)
    #Returns true if a piece of the same color is on the stop space
    piece = startSpace.piece
    if (startSpace.piece == stopSpace.piece)
      return true
    else
      false
    end
  end

  def blocked?(startSpace, index)
    #Returns true if the moving piece has a another piece in its path to the desired space
    listOfMoves = startSpace.piece.listMoves
    rootRow = startSpace.row
    rootCol = start.space.column
    count = index
    until (listOfMoves[count][0] == rootRow && listOfMoves[count][1] == rootCol)
      row = listOfMoves[count][0]
      column = moves[count][1]
      space = find(row, column)
    
      if !space.piece.nil?
        return true
      end
    end
    
    return false
  end
end