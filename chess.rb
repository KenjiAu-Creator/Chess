require_relative 'board.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'

class Chess
  def initialize()
    @chessBoard = Board.new
    playerInitialize()
    placePieces()
    playGame()
  end

  def placePieces
    placeWhite(@chessBoard)
    placeBlack(@chessBoard)
  end

  def placeWhite(chessBoard)
    chessBoard.find(1,1).setPiece(Rook.new(1,1,'white'))
    chessBoard.find(1,2).setPiece(Knight.new(1,2,'white'))
    chessBoard.find(1,3).setPiece(Bishop.new(1,3,'white'))
    chessBoard.find(1,4).setPiece(Queen.new(1,4,'white'))
    chessBoard.find(1,5).setPiece(King.new(1,5,'white'))
    chessBoard.find(1,6).setPiece(Bishop.new(1,6,'white'))
    chessBoard.find(1,7).setPiece(Knight.new(1,7,'white'))
    chessBoard.find(1,8).setPiece(Rook.new(1,8,'white'))

    chessBoard.find(2,1).setPiece(Pawn.new(2,1,'white'))
    chessBoard.find(2,2).setPiece(Pawn.new(2,2,'white'))
    chessBoard.find(2,3).setPiece(Pawn.new(2,3,'white'))
    chessBoard.find(2,4).setPiece(Pawn.new(2,4,'white'))
    chessBoard.find(2,5).setPiece(Pawn.new(2,5,'white'))
    chessBoard.find(2,6).setPiece(Pawn.new(2,6,'white'))
    chessBoard.find(2,7).setPiece(Pawn.new(2,7,'white'))
    chessBoard.find(2,8).setPiece(Pawn.new(2,8,'white'))
  end

  def placeBlack(chessBoard)
    chessBoard.find(8,1).setPiece(Rook.new(8,1,'black'))
    chessBoard.find(8,2).setPiece(Knight.new(8,2,'black'))
    chessBoard.find(8,3).setPiece(Bishop.new(8,3,'black'))
    chessBoard.find(8,4).setPiece(Queen.new(8,4,'black'))
    chessBoard.find(8,5).setPiece(King.new(8,5,'black'))
    chessBoard.find(8,6).setPiece(Bishop.new(8,6,'black'))
    chessBoard.find(8,7).setPiece(Knight.new(8,7,'black'))
    chessBoard.find(8,8).setPiece(Rook.new(8,8,'black'))

    chessBoard.find(7,1).setPiece(Pawn.new(7,1,'black'))
    chessBoard.find(7,2).setPiece(Pawn.new(7,2,'black'))
    chessBoard.find(7,3).setPiece(Pawn.new(7,3,'black'))
    chessBoard.find(7,4).setPiece(Pawn.new(7,4,'black'))
    chessBoard.find(7,5).setPiece(Pawn.new(7,5,'black'))
    chessBoard.find(7,6).setPiece(Pawn.new(7,6,'black'))
    chessBoard.find(7,7).setPiece(Pawn.new(7,7,'black'))
    chessBoard.find(7,8).setPiece(Pawn.new(7,8,'black'))
  end


  def playerInitialize
    @playerList = [Player.new(1, 'white'), Player.new(2, 'black')]
  end

  def playGame()

  end

end

class Player
  attr_reader :Id, :team

  def initialize(id, color)
    @Id = id
    @team = color
  end

end

game = Chess.new