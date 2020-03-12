class BoardSpace
  attr_accessor :row, :col, :piece, :next

  def initialize(row, column)
    @row = row
    @column = column
    @piece = nil
    @next = nil
  end

  def link(space)
    @next = space
  end
end