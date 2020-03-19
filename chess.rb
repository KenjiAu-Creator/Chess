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
    playersInitialize()
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


  def playersInitialize
    @players = [Player.new(0, 'white'), Player.new(1, 'black')]
    @currentPlayerId = 0
  end

  def playGame()
    #playerMove()
    
  end

  def playerMove()
    puts "Player #{@players[@currentPlayerId].team} turn"
    puts "Please enter which piece you would like to move."
    puts "Use #,# to pick the space."
    startSpace = gets.chomp()
    startBoardSpace = @chessBoard.find(startSpace[0], startSpace[2])
    puts "Please enter which space you would like to move to."
    puts "Use #,# to pick the space."
    stopSpace = gets.chomp()
    stopBoardSpace = @chessBoard.find(stopSpace[0], stopSpace[2])
    
    @chessBoard.move(startBoardSpace, stopBoardSpace)

  end

  def switchPlayers
    @currentPlayerId = otherPlayerId
    return @currentPlayerId
  end

  def currentPlayer
    @players[@currentPlayerId]
  end

  def otherPlayerId
    1 - @currentPlayerId
  end

  def winCondition
    
  end
end

class Player
  attr_reader :Id, :team, :pieceList

  def initialize(id, color)
    @Id = id
    @team = color
    @pieceList = {
      'king' => 1,
      'queen' => 1,
      'bishop' => 2,
      'rook' => 2,
      'knight' => 2,
      'pawn' => 8,
    }
  end

  def updatePieceCount(piece, count)
    @pieceList[piece] = count
  end
    
end

game = Chess.new