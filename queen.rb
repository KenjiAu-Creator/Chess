class Queen
  # Future work may include making the class include / extend other classes instead.
  attr_accessor :row, :columm, :team, :listMoves, :name
  
  def initialize(row, column, color)
    @row = row
    @column = column
    @team = color
    @listMoves = []
    @name = 'queen'
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
    rookMoves()
    bishopMoves()
    kingMoves()
  end

  def rookMoves
    @listMoves.push([@row, @column])

    for i in 1..8
      if i == @column
        next
      end

      move = [@row, i]
      @listMoves.push(move)
    end

    @listMoves.push([@row, @column])
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

    while row < 9 && col < 9
      move = [row,col]
      @listMoves.push(move)
      row += 1
      col += 1
    end

    row = @row
    col = @column

    while row < 9 && col > 0
      move = [row,col]
      @listMoves.push(move)
      row += 1
      col -= 1
    end

    row = @row
    col = @column

    while row > 0 && col < 9
      move = [row,col]
      @listMoves.push(move)
      row -= 1
      col += 1
    end

    row = @row
    col = @column

    while row > 0 && col > 0
      move = [row,col]
      @listMoves.push(move)
      row -= 1
      col -= 1
    end
  end

  def kingMoves
    for i in -1..1
      for j in -1..1
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