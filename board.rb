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

      if stop.piece.name == "pawn"
        pawnPromote(stop)
      end
      
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
    elsif startSpace.piece.name != "pawn" && blocked?(startSpace, iML[1])
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

  def pawnPromote(stopSpace)
    # The input piece must be a pawn
    piece = stopSpace.piece
    row = piece.row
    col = piece.column

    if piece.team == "White" && piece.row == 8
    # Piece can become a queen, rook, knight or bishop
      puts "Please enter which piece you would like to promote the pawn to:"
      puts "queen, rook, knight or bishop"
      choice = gets.chomp.downcase()
      case choice
      when 'queen'
        promoted = Queen.new(row, col, 'White')
      when 'rook'
        promoted = Rook.new(row, col, 'White')
      when 'knight'
        promted = Knight.new(row, col, 'White')
      when 'bishop'
        promoted = Bishop.new(row, col, 'White')
      end
      stopSpace.setPiece(promoted)

    elsif piece.team == "Black" && piece.row == 1
      # Pawn piece can become a queen, rook, knight or bishop
      puts "Please enter which piece you would like to promote the pawn to:"
      puts "queen, rook, knight or bishop"
      choice = gets.chomp.downcase()

      case choice
      when 'queen'
        promoted = Queen.new(row, col, 'Black')
      when 'rook'
        promoted = Rook.new(row, col, 'Black')
      when 'knight'
        promted = Knight.new(row, col, 'Black')
      when 'bishop'
        promoted = Bishop.new(row, col, 'Black')
      end
      stopSpace.setPiece(promoted)
    end
  end

end