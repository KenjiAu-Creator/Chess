class Queen
  # Future work may include making the class include / extend other classes instead.
  attr_accessor :row, :columm, :team, :listMoves
  def initialize(row, column, color)
    @row = row
    @column = column
    @team = color
    @listMoves = []
    possibleMoves()
  end

  def reset
    @listMoves = []
  end

  def updatePosition(row, column)
    @row = row
    @column = column
  end

  def possibleMoves
    rookMoves()
    knightMoves()
    bishopMoves()
    kingMoves()
  end

  def rookMoves
    for i in 1..8
      if i == @column
        next
      end

      move = [@row, i]
      @listMoves.push(move)
    end

    for i in 1..8
      if i == @row
        next
      end

      move = [i, @column]
      @listMoves.push(move)
    end
  end

  def bishopMoves
    row = @row
    col = @column
    while row < 8 && col < 8
      row += 1
      col += 1
      move = [row, col]
      @listMoves.push(move)
    end

    row = @row
    col = @column
    while row < 8 && col > 1
      row += 1
      col -= 1
      move = [move, col]
      @listMoves.push(move)
    end

    row = @row
    col = @column
    while row > 1 && col < 8
      row -= 1
      col += 1
      move = [row.col]
      @listMoves.push(move)
    end

    row = @row
    col = @column
    while row > 1 && col > 1
      row -= 1
      col -= 1
      move = [row,col]
      @listMoves.push(move)
    end
  end

  def kingMoves
    for i in -1..1
      for j in -1..1
        if (i == 0 && j == 0)
          next
        end
  
        row = @row + i
        col = @column + j
  
        if ((row > 0 && row < 9) && (col > 0 && col < 9))
          move = [row, col]
          @listMoves.push(move)
        end
      end
    end
  end
end