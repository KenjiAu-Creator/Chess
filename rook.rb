class Rook
  attr_accessor :row, :column, :team, :listMoves
  def initialize(row, column, color)
    @row = row
    @column = column
    @team = color
    @listMoves = []
  end

  def possibleMoves
    # The Rook piece can move vertically or horizontally across the board
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

  def resetMoves
    @listMoves = []
  end

  def updatePosition(row, column)
    @row = row
    @column = column
  end
end