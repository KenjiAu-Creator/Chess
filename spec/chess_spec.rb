require '../chess.rb'
require '../boardSpace.rb'
require '../board.rb'
require '../knight.rb'
require '../pawn.rb'
require '../rook.rb'

describe 'boardSpace' do
  context '# New board space' do
    it 'Creates a new single board space that is unoccupied' do
      game = BoardSpace.new(1,1) 
      expect(game.piece).to eql(nil)
    end
  end
end

describe 'Board' do
  context '# New Board' do
    it 'Creates 64 board spots' do
      game = Board.new()
      expect(game.size).to eql(64)
    end
  end

  context '#Find boardspace' do
    xit 'finds board spot 1,4' do
      game = Board.new
      testSpot = game.root.next.next.next.next
      expect(game.find(1,4)).to eql(testSpot)
    end
  end
end

describe 'Knight' do
  context '# New Knight piece' do
    xit 'Creates a new knight' do
      game = Board.new()
      game.find(1,2).piece = Knight.new(1,2)
      expect(game.find(1,2).piece).to be_a(Knight)
    end
  end

  context 'Knight piece' do
    xit 'Moves Knight piece from 1,2 to 2,4' do
      game = Board.new()
      startSpace = game.find(1,2)
      startSpace.setPiece(Knight.new(1,2))
      stopSpace = game.find(2,4)
      game.move(startSpace,stopSpace)
      
      expect(game.find(2,4).piece).to be_a(Knight)
    end
  end

  context 'Knight piece' do
    xit 'Removes Knight piece from 1,2 after moving to 2,4' do
      game = Board.new()
      startSpace = game.find(1,2)
      startSpace.setPiece(Knight.new(1,2))
      stopSpace = game.find(2,4)
      game.move(startSpace,stopSpace)
      
      expect(game.find(1,2).piece).to eql(nil)
    end
  end

  context 'Knight piece' do
    xit 'Checks moving 1,2 to 1,3 is a valid move' do
      game = Board.new
      startSpace = game.find(1,2)
      stopSpace = game.find(1,3)
      startSpace.setPiece(Knight.new(1,2))

      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  end
end

describe 'Rook piece' do
  context '#New Rook piece' do
    it 'Creates new Rook' do
      game = Board.new
      startSpace = game.find(1,1)
      startSpace.setPiece(Rook.new(1,1, 'white'))
      expect(game.find(1,1).piece).to be_a(Rook)
    end
  end

  context 'Rook piece' do
    it 'Moves Rook from 1,1 to 1,5' do
      game = Board.new
      startSpace = game.find(1,1)
      startSpace.setPiece(Rook.new(1,1, 'white'))
    
      stopSpace = game.find(1,5)
      game.move(startSpace, stopSpace)
      
      expect(game.find(1,5).piece).to be_a(Rook)
    end
  end

  context 'Rook piece' do
    it 'Moves rook from 1,1 to 7,1' do
      game = Board.new
      startSpace = game.find(1,1)
      startSpace.setPiece(Rook.new(1,1, 'white'))
      stopSpace = game.find(7,1)

      game.move(startSpace, stopSpace)
      expect(game.find(7,1).piece).to be_a(Rook)
    end
  end
end