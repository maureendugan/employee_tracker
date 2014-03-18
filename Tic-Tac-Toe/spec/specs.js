
describe('Board', function(){
  describe('create', function(){
    it('makes the nine board spaces with horizonal and vertical coords',function(){
    var nBoard = Object.create(Board);
    nBoard.create().should.eql(nBoard.row1spaces[0]);
  });
 });
});

describe('Game', function(){
  describe('turn', function(){
    it('designates and switches turns', function(){
    var newGame = Object.create(Game);
    newGame.turn = 'X';
    newGame.changeTurn(newGame.turn).should.equal('O') ;
    });
  });
  describe('assignSquare', function(){
    it('gives a square to a player who hath claimed it', function(){
    var newGame = Object.create(Game);
    newGame.turn = 'X';
    newGame.assignSquare(1).should.eql( [ Board.row1spaces[0] ])
     
    });
  });
   describe('winConditionCheck', function(){
    it('if a player gets 3 in a row, they win the game', function(){
    var newGame = Object.create(Game);
    newGame.turn = 'X';
    newGame.playerX.squares = [7,2,3];
    newGame.playerO.squares = [7,4,3];
    newGame.winConditionCheck().should.equal('running'); 
    });
  });
  describe('takenCheck', function(){
    it('checks if a clicked square has been used', function(){
    var newGame = Object.create(Game);
    newGame.turn = 'X';
    newGame.takenSquares = [1,2,3,4,5,6,7,8,9];
    newGame.takenCheck(1).should.equal(true); 
    });
  });
  describe('checkCats', function(){
    it('checks if the game is a tie', function(){
    var newGame = Object.create(Game);
    newGame.takenSquares = [1,2,3,4,5,6,7,8,9];
    newGame.turncount = 9;
    newGame.checkCats().should.equal(true); 
    });
  })
});
