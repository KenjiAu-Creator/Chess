class Pawn
  attr_accessor :row, :column, :team, :possibleMoves, :listMoves, :name

  def initialize(row, column, color)
    @row = row
    @column = column
    @team = color
    @listMoves = []
    @name = 'pawn'
    possibleMoves
  end

  def possibleMoves
    @listMoves.push([@row,@column])
    if @team == 'White'
      move = [@row + 1, column]
      @listMoves.push(move)
      if @row == 2
        move = [@row + 2, column]
        @listMoves.push(move)
      end
    elsif @team == 'Black'
      move = [@row - 1, column]
      @listMoves.push(move)
      if @row == 7
        move = [@row - 2, column]
        @listMoves.push(move)
      end
    end

    attackMoves()
  end

  def resetMoves
    @listMoves = []
  end

  def updatePosition(row, column)
    @row = row
    @column = column
  end

  def attackMoves
    col1 = @column - 1
    col2 = @column + 1

    if @team == 'White'
      if col1 > 0
        move = [@row + 1, col1]
        @listMoves.push(move)
      end

      if col2 < 9
        move = [@row + 1, col2]
        @listMoves.push(move)
      end

    elsif @team == 'Black'
      if col1 > 0
        move = [@row -1, col1]
        @listMoves.push(move)
      end

      if col2 < 9
        move = [@row -1, col2]
        @listMoves.push(move)
      end
    end
  end
end