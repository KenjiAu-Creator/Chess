class Rook
  attr_accessor :row, :column, :team, :listMoves, :name
  def initialize(row, column, color)
    @row = row
    @column = column
    @team = color
    @listMoves = []
    @name = 'rook'
    possibleMoves
  end

  def possibleMoves
    # The Rook piece can move vertically or horizontally across the board
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

  def resetMoves
    @listMoves = []
  end

  def updatePosition(row, column)
    @row = row
    @column = column
  end
end