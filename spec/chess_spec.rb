require '../chess.rb'
require '../boardSpace.rb'
require '../board.rb'
require '../knight.rb'
require '../king.rb'

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
    it 'finds board spot 1,4' do
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

describe 'King piece' do
  context '#New King piece' do
    it 'Creates the king' do
      game = Board.new
      startSpace = game.find(1,4)
      startSpace.setPiece(King.new(1,4,'white'))
      expect(game.find(1,4).piece).to be_a(King)
    end
  end

  context '#Move king piece' do
    it 'Moves the king one space to the left' do
      game = Board.new
      startSpace = game.find(1,4)
      stopSpace = game.find(1,3)
      startSpace.setPiece(King.new(1,4,'white'))
      game.move(startSpace, stopSpace)
      expect(game.find(1,3).piece).to be_a(King)
    end
  end

  context '#Move king piece' do
    it "Tries to move the kind two spaces" do
      game = Board.new
      startSpace = game.find(1,3)
      stopSpace = game.find(1,5)
      startSpace.setPiece(King.new(1,3,'white'))
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  end
  
  context '#Move King piece' do
    it "Tries to move king off the board" do
      game = Board.new
      startSpace = game.find(1,3)
      startSpace.setPiece(King.new(1, 3, 'white'))
      stopSpace = BoardSpace.new(0,3)
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  end
end