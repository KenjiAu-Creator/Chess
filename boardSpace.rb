require 'json'
class BoardSpace
  attr_accessor :row, :column, :piece, :next

  def initialize(row, column)
    @row = row
    @column = column
    @piece = nil
    @next = nil
  end

  def link(space)
    @next = space
  end

  def setPiece(piece)
    @piece = piece
  end

  def to_json(*args)
    if @piece.nil?
      piece = nil
    else
      piece = @piece
    end

    value = "#{@row}#{@column}"

    {'Board Space' => value,
    'Piece' => piece}.to_json(*args)
  end
end