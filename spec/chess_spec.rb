Dir["/home/kenji/the_odin_project/Ruby_Programming/Chess/*.rb"].each do |file|
  require file
end

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

describe 'Pawn piece' do
  context '# New pawn piece' do
     it "Creates new pawn" do
      game = Board.new
      startSpace = game.find(2,1)
      startSpace.setPiece(Pawn.new(2,1, 'white'))

      expect(game.find(2,1).piece).to be_a(Pawn)
    end
  end

  context '#Move pawn piece' do
    it 'Moves pawn from 2,2 to 3,2' do
      game = Board.new
      startSpace = game.find(2,2)
      startSpace.setPiece(Pawn.new(2, 2, 'white'))
      stopSpace = game.find(3,2)
      game.move(startSpace, stopSpace)
      expect(game.find(3,2).piece).to be_a(Pawn)

    end
  end

  context '#Move black pawn' do
    it 'Invalid move with black moving backwards' do
      game = Board.new
      startSpace = game.find(6,1)
      startSpace.setPiece(Pawn.new(6,1, 'black'))
      stopSpace = game.find(7,1)
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
describe 'bishop' do
  context '#New bishop piece' do
    it 'creates a new bishop' do
      game = Board.new
      startSpace = game.find(1,3)
      startSpace.setPiece(Bishop.new(1,3,'white'))
      expect(game.find(1,3).piece).to be_a(Bishop)
    end
  end

  context '#Move bishop piece' do
    it 'Moves bishop from 1,3 to 3,5' do
      game = Board.new
      startSpace = game.find(1,3)
      stopSpace = game.find(3,5)
      startSpace.setPiece(Bishop.new(1, 3, 'white'))
      
      game.move(startSpace, stopSpace)
      expect(game.find(3,5).piece).to be_a(Bishop)
    end
  end

  context '#Move Bishop' do
    it 'checks moving from 1,3 to 2,3 is a valid move' do
      game = Board.new
      startSpace = game.find(1,3)
      stopSpace = game.find(2,3)
      startSpace.setPiece(Bishop.new(1,3, 'white'))
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  end

  context '#Move Bishop' do
    it 'checks moving from 1,3 to 2,2 is a valid move' do
      game = Board.new
      startSpace = game.find(1,3)
      stopSpace = game.find(2,2)
      startSpace.setPiece(Bishop.new(1,3, 'white'))
      game.move(startSpace, stopSpace)
      expect(game.find(2,2).piece).to be_a(Bishop)
    end
  end
end
