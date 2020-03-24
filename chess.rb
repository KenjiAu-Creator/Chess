require_relative 'board.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'

class Chess
  attr_reader :players, :chessBoard

  def initialize()
    @chessBoard = Board.new
    placePieces()
    playersInitialize()
    displayBoard()
    #playGame()
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

    row8 = "H|_#{rookB}_|_#{knightB}_|_#{bishopB}_|_#{queenB}_|_#{kingB}_|_#{bishopB}_|_#{knightB}_|_#{rookB}_|"
    row7 = "G|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|_#{pawnB}_|"
    row6 = "F|___|___|___|___|___|___|___|___|"
    row5 = "E|___|___|___|___|___|___|___|___|"
    row4 = "D|___|___|___|___|___|___|___|___|"
    row3 = "C|___|___|___|___|___|___|___|___|"
    row2 = "B|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|_#{pawnW}_|"
    row1 = "A|_#{rookW}_|_#{knightW}_|_#{bishopW}_|_#{queenW}_|_#{kingW}_|_#{bishopW}_|_#{knightW}_|_#{rookW}_|"
    row0 = "   1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 "

    @board = [row0, row1, row2, row3, row4, row5, row6, row7, row8]
    puts @board.reverse
  end

  def updateBoard(startSpace, stopSpace, playerId, piece)
    # BoardSpace input as [#,#]
    row = startSpace.row
    column = startSpace.column
    
    case column
    when 1
      colIndex = 3
    when 2
      colIndex = 7
    when 3
      colIndex = 11
    when 4
      colIndex = 15
    when 5
      colIndex = 19
    when 6
      colIndex = 23
    when 7
      colIndex = 27
    when 8
      colIndex = 31
    end
    
    @board[row][colIndex] = "_"

    row = stopSpace.row
    column = stopSpace.column
    
    case column
    when 1
      colIndex = 3
    when 2
      colIndex = 7
    when 3
      colIndex = 11
    when 4
      colIndex = 15
    when 5
      colIndex = 19
    when 6
      colIndex = 23
    when 7
      colIndex = 27
    when 8
      colIndex = 31
    end

    case playerId
    when 1
      case piece
      when 'knight'
        token = "\u2658"
      when 'rook'
        token = "\u2656"
      when 'bishop'
        token = "\u2657"
      when 'queen'
        token = "\u2655"
      when 'king' 
        token = "\u2654"
      when 'pawn'
        token = "\u2659"
      end
    when 0
      case piece
      when 'knight'
        token = "\u265E"
      when 'rook'
        token = "\u265C"
      when 'bishop'
        token = "\u265D"
      when 'queen'
        token = "\u265B"
      when 'king'
        token = "\u265A"
      when 'pawn'
        token = "\u265F"
      end
    end
    @board[row][colIndex] = token
    puts @board.reverse
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
    linkPlayerWhitePieces()
    linkPlayerBlackPieces()
  end

  def playGame()
    while !gameOver?
      startSpace, stopSpace = getPlayerMove()
      updateBoard(startSpace, stopSpace, @currentPlayerId, stopSpace.piece.name)
      switchPlayers()
      checkMessage(stopSpace)
    end
  end

  def getPlayerMove()
    puts "#{@players[@currentPlayerId].team}\'s turn"
    puts "Please enter which piece you would like to move."
    puts "Use the format [Letter, number]."
    startSpaceString = gets.chomp()
    row = startSpaceString[0]

    case row
    when 'A'
      rowIndex = 1
    when 'B'
      rowIndex = 2
    when 'C'
      rowIndex = 3
    when 'D'
      rowIndex = 4
    when 'E'
      rowIndex = 5
    when 'F'
      rowIndex = 6
    when 'G'
      rowIndex = 7
    when 'H'
      rowIndex = 8
    end

    col = startSpaceString[2].to_i
    startBoardSpace = @chessBoard.find(rowIndex, col)
    puts "Please enter which space you would like to move to."
    puts "Use #,# to pick the space."
    puts startBoardSpace.piece.listMoves.inspect

    puts "Please enter which space you would like to move to."
    puts "Use the format [Letter, number]."

    stopSpaceString = gets.chomp()
    row = stopSpaceString[0]
    case row
    when 'A'
      rowIndex = 1
    when 'B'
      rowIndex = 2
    when 'C'
      rowIndex = 3
    when 'D'
      rowIndex = 4
    when 'E'
      rowIndex = 5
    when 'F'
      rowIndex = 6
    when 'G'
      rowIndex = 7
    when 'H'
      rowIndex = 8
    end

    col = stopSpaceString[2].to_i
    stopBoardSpace = @chessBoard.find(rowIndex, col)

    @chessBoard.move(startBoardSpace, stopBoardSpace)

    col = stopSpaceString[2].to_i
    stopBoardSpace = @chessBoard.find(rowIndex, col)

    if @chessBoard.move(startBoardSpace, stopBoardSpace)
      return startBoardSpace, stopBoardSpace
    else
      getPlayerMove()
    end

    return startBoardSpace, stopBoardSpace

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

  def checkMessage(currentPieceSpace)
    if @chessBoard.check?(currentPieceSpace)
      puts "Check! You must move your king!"
    end
  end

  def linkPlayerWhitePieces
    for i in 1..2
      for j in 1..8
        piece = @chessBoard.find(i,j).piece
        @players[0].playerLinkedPieces(piece)
      end
    end
  end

  def linkPlayerBlackPieces
    for i in 7..8
      for j in 1..8
        piece = @chessBoard.find(i,j).piece
        @players[0].playerLinkedPieces(piece)
      end
    end
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
    @linkedList = []
  end

  def updatePieceCount(piece, count)
    @pieceList[piece] = count
  end
    
  def playerLinkedPieces(piece)
    @linkedList.push(piece)
  end
end

game = Chess.new