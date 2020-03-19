class King
  attr_accessor :row, :column, :team, :listMoves, :name

  def initialize(row, column, color)
    @row = row
    @column = column
    @team = color
    @listMoves = []
    @name = 'king'
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