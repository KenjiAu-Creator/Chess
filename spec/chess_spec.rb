require '../chess.rb'

describe 'Player' do
  context '#New player' do
    it "Creates a new player" do
      player1 = Player.new(0,'white')
      expect(player1).to be_a(Player)
    end
  end

  context 'New Player' do
    it "Checks for the king piece" do
        player1 = Player.new(0,'white')
        expect(player1.pieceList['king']).to eql(1)
    end
  end

  context 'New Player' do
    it "Checks for the pawn piece" do
        player1 = Player.new(0,'white')
        expect(player1.pieceList['pawn']).to eql(8)
    end
  end

  context 'Player' do
    it 'removes the king piece from the list' do
      player1 = Player.new(0,'white')
      player1.updatePieceCount('king',0)
      expect(player1.pieceList['king']).to eql(0)
    end
  end
end