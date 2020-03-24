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
    it 'finds board spot 1,4' do
      game = Board.new
      testSpot = game.root.next.next.next.next
      expect(game.find(1,4)).to eql(testSpot)
    end
  end
end

describe 'Knight' do
  context 'Knight piece' do
    let(:game) {Board.new}
    it 'Creates a new knight' do
      game.find(1,2).piece = Knight.new(1,2, 'White')
      expect(game.find(1,2).piece).to be_a(Knight)
    end

    it 'Moves Knight piece from 1,2 to 2,4' do
      startSpace = game.find(1,2)
      startSpace.setPiece(Knight.new(1,2, 'White'))
      stopSpace = game.find(2,4)
      game.move(startSpace,stopSpace)
      expect(game.find(2,4).piece).to be_a(Knight)
    end

    it 'Removes Knight piece from 1,2 after moving to 2,4' do
      startSpace = game.find(1,2)
      startSpace.setPiece(Knight.new(1,2, 'White'))
      stopSpace = game.find(2,4)
      game.move(startSpace,stopSpace)
      expect(game.find(1,2).piece).to eql(nil)
    end

    it 'Checks moving 1,2 to 1,3 is a valid move' do
      startSpace = game.find(1,2)
      stopSpace = game.find(1,3)
      startSpace.setPiece(Knight.new(1,2, 'White'))
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  end
end

describe 'Pawn piece' do
  context '#pawn piece' do
    let(:game) {Board.new}
     it "Creates new pawn" do
      startSpace = game.find(2,1)
      startSpace.setPiece(Pawn.new(2,1, 'White'))
      expect(game.find(2,1).piece).to be_a(Pawn)
    end

    it 'Moves pawn from 2,2 to 3,2' do
      startSpace = game.find(2,2)
      startSpace.setPiece(Pawn.new(2, 2, 'White'))
      stopSpace = game.find(3,2)
      game.move(startSpace, stopSpace)
      expect(game.find(3,2).piece).to be_a(Pawn)
    end

    it 'Invalid move with black moving backwards' do
      startSpace = game.find(6,1)
      startSpace.setPiece(Pawn.new(6,1, 'Black'))
      stopSpace = game.find(7,1)
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end

    it 'Moves two spaces forward' do
      startSpace = game.find(7,1)
      startSpace.setPiece(Pawn.new(7,1,'Black'))
      stopSpace = game.find(5,1)
      expect(game.validMove(startSpace, stopSpace)).to eql(true)
    end
  
    it 'Moves two spaces forward' do
      startSpace = game.find(2,1)
      startSpace.setPiece(Pawn.new(2,1,'White'))
      stopSpace = game.find(4,1)
      expect(game.validMove(startSpace, stopSpace)).to eql(true)
    end
  
    it 'Pawn attack move' do
      startSpace = game.find(3,3)
      startSpace.setPiece(Pawn.new(3,3, 'White'))
      stopSpace = game.find(4,4)
      stopSpace.setPiece(Pawn.new(4,4,'Black'))
      expect(game.validMove(startSpace, stopSpace)).to eql(true)
    end

    it 'False attack move' do 
      startSpace = game.find(3,3)
      startSpace.setPiece(Pawn.new(3,3, 'White'))
      stopSpace = game.find(4,4)
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  end
end

describe 'Rook piece' do
  context 'Rook piece' do
    let(:game) {Board.new}
    it 'Creates new Rook' do
      startSpace = game.find(1,1)
      startSpace.setPiece(Rook.new(1,1, 'White'))
      expect(game.find(1,1).piece).to be_a(Rook)
    end

    it 'Moves Rook from 1,1 to 1,5' do
      startSpace = game.find(1,1)
      startSpace.setPiece(Rook.new(1,1, 'White'))
      stopSpace = game.find(1,5)
      game.move(startSpace, stopSpace)
      expect(game.find(1,5).piece).to be_a(Rook)
    end

    it 'Moves rook from 1,1 to 7,1' do
      startSpace = game.find(1,1)
      startSpace.setPiece(Rook.new(1,1, 'White'))
      stopSpace = game.find(7,1)
      game.move(startSpace, stopSpace)
      expect(game.find(7,1).piece).to be_a(Rook)
    end
  end
end

describe 'King piece' do
  context 'King piece' do
    let(:game) {Board.new}
    it 'Creates the king' do
      startSpace = game.find(1,4)
      startSpace.setPiece(King.new(1,4,'White'))
      expect(game.find(1,4).piece).to be_a(King)
    end

    it 'Moves the king one space to the left' do
      startSpace = game.find(1,4)
      stopSpace = game.find(1,3)
      startSpace.setPiece(King.new(1,4,'White'))
      game.move(startSpace, stopSpace)
      expect(game.find(1,3).piece).to be_a(King)
    end

    it "Tries to move the king two spaces" do
      startSpace = game.find(1,3)
      stopSpace = game.find(1,5)
      startSpace.setPiece(King.new(1,3,'White'))
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  
    it "Tries to move king off the board" do
      startSpace = game.find(1,3)
      startSpace.setPiece(King.new(1, 3, 'White'))
      stopSpace = BoardSpace.new(0,3)
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end
  end
end

describe 'bishop' do
  context '#New bishop piece' do
    let(:game) {Board.new}
    it 'creates a new bishop' do
      startSpace = game.find(1,3)
      startSpace.setPiece(Bishop.new(1,3,'White'))
      expect(game.find(1,3).piece).to be_a(Bishop)
    end

    it 'Moves bishop from 1,3 to 3,5' do
      startSpace = game.find(1,3)
      stopSpace = game.find(3,5)
      startSpace.setPiece(Bishop.new(1, 3, 'White'))
      game.move(startSpace, stopSpace)
      expect(game.find(3,5).piece).to be_a(Bishop)
    end

    it 'checks moving from 1,3 to 2,3 is a valid move' do
      startSpace = game.find(1,3)
      stopSpace = game.find(2,3)
      startSpace.setPiece(Bishop.new(1,3, 'White'))
      expect(game.validMove(startSpace, stopSpace)).to eql(false)
    end

    it 'checks moving from 1,3 to 2,2 is a valid move' do
      startSpace = game.find(1,3)
      stopSpace = game.find(2,2)
      startSpace.setPiece(Bishop.new(1,3, 'White'))
      game.move(startSpace, stopSpace)
      expect(game.find(2,2).piece).to be_a(Bishop)
    end
  end
end

describe 'Queen piece' do
  context '#New Queen piece' do
    let(:game) {Board.new}
    it 'Creates a new queen' do
      startSpace = game.find(1,5)
      startSpace.setPiece(Queen.new(1,5,'White'))
      expect(game.find(1,5).piece).to be_a(Queen)
    end

   it 'Moves like a bishop' do
      startSpace = game.find(1,5)
      startSpace.setPiece(Queen.new(1,5,'White'))
      stopSpace = game.find(3,7)
      game.move(startSpace, stopSpace)
      expect(game.find(3,7).piece).to be_a(Queen)
    end

    it 'Moves like a rook' do
      startSpace = game.find(1,5)
      startSpace.setPiece(Queen.new(1,5,'White'))
      stopSpace = game.find(6,5)
      game.move(startSpace, stopSpace)
      expect(game.find(6,5).piece).to be_a(Queen)
    end
  end
end

describe 'Board and King' do
  context 'Check function' do
    let(:game) {Board.new}
    it 'Testing the check function' do
      kingSpace = game.find(1,1)
      kingSpace.setPiece(King.new(1, 1, 'White'))
      rookSpace = game.find(8, 1)
      rookSpace.setPiece(Rook.new(8, 1, 'Black'))
      possible, index = game.checkPossible?(rookSpace)
      expect(possible).to eql(true)
    end

    it 'Testing check function if blocked' do
      kingSpace = game.find(1,1)
      kingSpace.setPiece(King.new(1, 1, 'White'))
      rookSpace = game.find(8, 1)
      rookSpace.setPiece(Rook.new(8, 1, 'Black'))
      pawnSpace = game.find(2,1)
      pawnSpace.setPiece(Pawn.new(2, 1, 'White'))
      expect(game.check?(rookSpace)).to eql(false)
    end
  end
end