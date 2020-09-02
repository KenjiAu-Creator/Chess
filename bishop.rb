class Bishop
  attr_accessor :row, :name, :column, :team, :listMoves
  def initialize(row, column, color)
    @row = row
    @column = column
    @team = color
    @listMoves = []
    @name = 'bishop'
    possibleMoves()
  end

  def resetMoves
    @listMoves = []
  end

  def updatePosition(row, column)
    @row = row
    @column = column
  end

  def possibleMoves
    upRight()
    upLeft()
    downRight()
    downLeft()
  end

  def upRight
    row = @row
    col = @column
    while row < 9 && col < 9
      move = [row, col]
      @listMoves.push(move)
      row += 1
      col += 1
    end
  end

  def upLeft
    row = @row
    col = @column
    while row < 9 && col > 0
      move = [row, col]
      @listMoves.push(move)
      row += 1
      col -= 1
    end
  end

  def downRight
    row = @row
    col = @column
    while row > 0 && col < 9
      move = [row, col]
      @listMoves.push(move)
      row -= 1
      col += 1
    end
  end

  def downLeft
    row = @row
    col = @column
    while row > 0 && col > 0
      move = [row, col]
      @listMoves.push(move)
      row -= 1
      col -= 1
    end
  end
end