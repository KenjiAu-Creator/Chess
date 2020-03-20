require_relative 'board.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'

class Chess
  attr_reader :players

  def initialize()
    @chessBoard = Board.new
    playersInitialize()
    placePieces()
    displayBoard()
    playGame()
  end

  def intro
    puts "Welcome to the game of Chess."
    puts "The objective of this game is to take the other players King piece."
  end

  def displayBoard
    knightB = "\u2658"
    rookB = "\u2656"
    bishopB = "\u2657"
    queenB = "\u2655"
    kingB = "\u2654"
    pawnB = "\u2659"

    knightW = "\u265E"
    rookW = "\u265C"
    bishopW = "\u265D"
    queenW = "\u265B"
    kingW = "\u265A"
    pawnW = "\u265F"

    row0 = "H|_#{rookB}_|_#{knightB}_|_#{bishopB}_|_#{queenB}_|_#{kingB}_|_#{bishopB}_|_#{knightB}_|_#{rookB}_|"
    row8 = "G|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|"
    row7 = "F|___|___|___|___|___|___|___|___|"
    row6 = "E|___|___|___|___|___|___|___|___|"
    row5 = "D|___|___|___|___|___|___|___|___|"
    row4 = "C|___|___|___|___|___|___|___|___|"
    row3 = "B|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|"
    row2 = "A|_#{rookW}_|_#{knightW}_|_#{bishopW}_|_#{queenW}_|_#{kingW}_|_#{bishopW}_|_#{knightW}_|_#{rookW}_|"
    row1 = "   1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 "

    board = [row0,row8,row7,row6,row5,row4,row3,row2,row1]
    puts board

  end

  def placePieces
    placeWhite(@chessBoard)
    placeBlack(@chessBoard)
  end

  def placeWhite(chessBoard)
    chessBoard.find(1,1).setPiece(Rook.new(1,1,'White'))
    chessBoard.find(1,2).setPiece(Knight.new(1,2,'White'))
    chessBoard.find(1,3).setPiece(Bishop.new(1,3,'White'))
    chessBoard.find(1,4).setPiece(Queen.new(1,4,'White'))
    chessBoard.find(1,5).setPiece(King.new(1,5,'White'))
    chessBoard.find(1,6).setPiece(Bishop.new(1,6,'White'))
    chessBoard.find(1,7).setPiece(Knight.new(1,7,'White'))
    chessBoard.find(1,8).setPiece(Rook.new(1,8,'White'))

    chessBoard.find(2,1).setPiece(Pawn.new(2,1,'White'))
    chessBoard.find(2,2).setPiece(Pawn.new(2,2,'White'))
    chessBoard.find(2,3).setPiece(Pawn.new(2,3,'White'))
    chessBoard.find(2,4).setPiece(Pawn.new(2,4,'White'))
    chessBoard.find(2,5).setPiece(Pawn.new(2,5,'White'))
    chessBoard.find(2,6).setPiece(Pawn.new(2,6,'White'))
    chessBoard.find(2,7).setPiece(Pawn.new(2,7,'White'))
    chessBoard.find(2,8).setPiece(Pawn.new(2,8,'White'))
  end

  def placeBlack(chessBoard)
    chessBoard.find(8,1).setPiece(Rook.new(8,1,'Black'))
    chessBoard.find(8,2).setPiece(Knight.new(8,2,'Black'))
    chessBoard.find(8,3).setPiece(Bishop.new(8,3,'Black'))
    chessBoard.find(8,4).setPiece(Queen.new(8,4,'Black'))
    chessBoard.find(8,5).setPiece(King.new(8,5,'Black'))
    chessBoard.find(8,6).setPiece(Bishop.new(8,6,'Black'))
    chessBoard.find(8,7).setPiece(Knight.new(8,7,'Black'))
    chessBoard.find(8,8).setPiece(Rook.new(8,8,'Black'))

    chessBoard.find(7,1).setPiece(Pawn.new(7,1,'Black'))
    chessBoard.find(7,2).setPiece(Pawn.new(7,2,'Black'))
    chessBoard.find(7,3).setPiece(Pawn.new(7,3,'Black'))
    chessBoard.find(7,4).setPiece(Pawn.new(7,4,'Black'))
    chessBoard.find(7,5).setPiece(Pawn.new(7,5,'Black'))
    chessBoard.find(7,6).setPiece(Pawn.new(7,6,'Black'))
    chessBoard.find(7,7).setPiece(Pawn.new(7,7,'Black'))
    chessBoard.find(7,8).setPiece(Pawn.new(7,8,'Black'))
  end


  def playersInitialize
    @players = [Player.new(0, 'White'), Player.new(1, 'Black')]
    @currentPlayerId = 0
  end

  def playGame()
    intro()
    while !gameOver?
      playerMove()
      updateBoard()
      switchPlayers()
    end
  end

  def playerMove()
    puts "#{@players[@currentPlayerId].team}\'s turn"
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

  def gameOver?
    kingCount = players[@currentPlayerId].pieceList['king']
    if kingCount == 0
      return true
    else
      return false
    end
  end

  def pieceCount
    pieceList = players[@currentPlayerId].pieceList
    pieceList.each do |key, value|
      count = 0
      current = @chessBoard.root.next
      until current == @chessBoard.find(8,8)
        if current.piece.nil?
          current = current.next
          next
        elsif current.piece.name == key
          count += 1
        end
        current = current.next
      end
      
      players[@currentPlayerId].updatePieceCount(key,count)
    end

    return players[@currentPlayerId].pieceList
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