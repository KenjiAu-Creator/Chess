class Knight
  # This class defines the Knight piece in chess.
  # It is initialized by a row and column parameter.
  # Moving the piece will require an input of where the piece wishes to go.

  attr_accessor :row, :column, :listMoves, :team

  def initialize(row,column, color)
    @row = row
    @column = column
    @listMoves = []
    @team = color
    possibleMoves()
  end

  def possibleMoves
    @listMoves.push([@row, @column])
    # This move is +2 up +1 right
    move = [@row + 2, @column + 1]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    # This move is +1 up +2 right
    move = [@row + 1, @column + 2]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    # This move is -2 down -1 left
    move = [@row - 2, @column -1]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    # This move is -1 down -2 left
    move = [@row - 1, @column - 2]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    # This move is +2 up -1 left
    move = [@row + 2, @column - 1]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    # This move is +1 up -2 left
    move = [@row + 1, @column - 2]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    # This move is -2 down + 1 right
    move = [@row - 2, @column + 1]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    # This move is -1 down + 2 right
    move = [@row - 1, @column + 2]
    if ((move[0] > 0 && move[1] < 9) && (move[1] > 0 && move[1] < 9))
      @listMoves.push(move)
    end
    return @listMoves
  end

  def resetMoves
    @listMoves = []
  end

  def updatePosition(row, column)
    @row = row
    @column = column
  end

end