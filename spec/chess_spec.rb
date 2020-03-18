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

    context '#Move pawn piece' do
      it 'Moves pawn twice' do
        game = Board.new
        startSpace = game.find(2,2)
        startSpace.setPiece(Pawn.new(2,2,'white'))
        midSpace = game.find(3,2)
        # First move
        game.move(startSpace,midSpace)

        # Second move
        stopSpace = game.find(4,2)
        game.move(midSpace,stopSpace)

        expect(game.find(4,2).piece).to be_a(Pawn)
      end
    end

    context '#Move black pawn piece' do
      it 'Moves black pawn one spot' do
        game = Board.new
        startSpace = game.find(7,1)
        startSpace.setPiece(Pawn.new(7,1, 'black'))
        stopSpace = game.find(6,1)

        game.move(startSpace, stopSpace)
        expect(game.find(6,1).piece).to be_a(Pawn)
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
