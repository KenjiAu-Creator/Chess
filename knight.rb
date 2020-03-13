class Knight
  # This class defines the Knight piece in chess.
  # It is initialized by a row and column parameter.
  # Moving the piece will require an input of where the piece wishes to go.

  def initialize(row,column)
    @row = row
    @column = column
    @possibleMoves = []
  end

  def knight_move(boardSpace)
    # This move is +2 up +1 right
    if ((boardSpace.row - @row) == 2 && (boardSpace.column - @column) == 1) 
      @possibleMoves.push(boardSpace)
    end

    # This move is +1 up +2 right
    if ((boardSpace.row - @row) == 1 && (boardSpace.column - @column) == 2) 
      @possibleMoves.push(boardSpace)
    end

    # This move is -2 down -1 left
    if ((@row - boardSpace.row) == 2 && (@column - boardSpace.column) == 1)
      @possibleMoves.push(boardSpace)
    end

    # This move is -1 down -2 left
    if ((@row - boardSpace.row) == 1 && (@column - boardSpace.column) == 2)
      @possibleMoves.push(boardSpace)
    end

    # This move is +2 up -1 left
    if ((boardSpace.row - @row) == 2 && (@column - boardSpace.column) == 1)
      @possibleMoves.push(boardSpace)
    end

    # This move is +1 up -2 left
    if ((boardSpace.row - @row) == 1 && (@column - boardSpace.column) == 2)
      @possibleMoves.push(boardSpace)
    end

    # This move is -2 down + 1 right
    if ((@row - boardSpace.row) == 2 && (boardSpace.column - @column) == 1)
      @possibleMoves.push(boardSpace)
    end

    # This move is -1 down + 2 right
    if ((@row - boardSpace.row) == 1 && (boardSpace.column - @column) == 2)
      @possibleMoves.push(boardSpace)
    end
  end

  def move(boardSpace)
    knight_move(boardSpace)
    if @possibleMoves.include?(boardSpace)
      @row = boardSpace.row
      @column = boardSpace.column
    end
  end
end