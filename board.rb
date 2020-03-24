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
    current = @root.next
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
      return true
    else
      puts "Invalid move"
      return false
    end
  end

  def validMove(startSpace, stopSpace)
    iML = inMoveList?(startSpace, stopSpace)

    if startSpace.piece.name == "pawn"
      if !pawnMove(startSpace, stopSpace)
        return false
      end
    end

    if sameSpace?(startSpace, stopSpace)
      # Makes sure the start isn't the ending space
      return false

    elsif !(iML[0])
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
    # Returns true if the ending space is possible for the piece.
    # Returns the index for the list of moves for the respective piece as well. 

    row = stopSpace.row
    column = stopSpace.column
    count = 0

    startSpace.piece.listMoves.each do |boardSpace|
      startRow = boardSpace[0]
      startCol = boardSpace[1]

      if startRow == row && startCol == column
        return [true, count]
      end

      count += 1
    end

    return [false,0]    
  end

  def collision?(startSpace, stopSpace)
    #Returns true if a piece of the same color is on the stop space
    attackPiece = startSpace.piece
    defendPiece = stopSpace.piece

    if defendPiece.nil?
      return false
    end

    if (attackPiece.team == defendPiece.team)
      return true
    else
      false
    end
  end

  def blocked?(startSpace, index)
    # Returns true if the moving piece has a another piece in its path to the desired space

    listOfMoves = startSpace.piece.listMoves
    rootRow = startSpace.row
    rootCol = startSpace.column
    count = index - 1

    # Starts at right before the index (end spot) and checks if a piece exists.
    # Works backwards until it is at the starting space.

    until (listOfMoves[count][0] == rootRow && listOfMoves[count][1] == rootCol)
      row = listOfMoves[count][0]
      column = listOfMoves[count][1]
      space = find(row, column)
    
      if !space.piece.nil?
        return true
      end
      count -= 1
    end
    
    return false
  end

  def pawnMove(startSpace, stopSpace)
    if (startSpace.column - stopSpace.column).abs == 1
      if !stopSpace.piece.nil?
        return true
      else
        return false
      end

    elsif startSpace.column == stopSpace.column
      if stopSpace.piece.nil?
        return true
      else
        return false
      end

    else
      return false
    end
  end

  def kingMove(startSpace, stopSpace)
    #This method will return true if the king can move
    # It will return false if the position is a check
    # Need to check each of the kings moves and then check through each of the opposing players pieces to see
    # if it is included
  end

  def checkPossible?(startSpace)
    # Checks if the king piece is in the current piece's possible list of moves.
    # Returns true if the king is in the list.

    piece = startSpace.piece
    listOfMoves = piece.listMoves
    count = 0

    listOfMoves.each do |space|
      count += 1
      row = space[0]
      col = space[1]
      boardSpace = find(row, col)
      if boardSpace.piece.nil?
        next
      elsif boardSpace.piece.name == 'king'
        return true, count
      end
    end
  end

  def check?(startSpace)
    # If the move is possible and not blocked return true.

    possible, index = checkPossible?(startSpace)
    if (possible && !blocked?(startSpace, index))
      return true
    else
      return false
    end
  end
end