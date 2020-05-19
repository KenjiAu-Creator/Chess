Assignment

1. Build a command line Chess game where two players can play against each other.
2. The game should be properly constrained - it should prevent players from making illegal moves and declare check or check amte in the correct situations.
3. Make it so you can save the board at any time
4. Write tests for the important parts. You don't need to TDD but be sure to use RSpec for tests for anything you find yourself typing into the ocmmand line repeatedly.
5. Do you best to keep your classes modular and clean and your methods doing only one thing each. This is the largest program that you've written, so you'll definitely start to see the benefits of good organization and when you start running into bugs. 


Chess is a two-player strategy board game played on a checkered board with 64 squares arranged in an 8x8 grid. 

Each player begins withs 16 pieces: one king, one queen, two rooks, two knights, two bishops, and eight pawns. Each piece type moves differently, with the most powerful being the queen and the least powerful the pawn. 

The objective is to checkmate the opponents king by placing it undeer an inescapable threat of capture. 

To run the program use the command $ ruby chess.rb