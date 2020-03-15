class King
  attr_accessor :row, :column, :team, :listMoves

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