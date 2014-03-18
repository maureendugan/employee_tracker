var Game = {
  fullTurn: function(clickedSquare){
    this.assignSquare(clickedSquare)
    this.winConditionCheck();
    if (this.checkCats() ){
            alert('cats game!')
          }   
  },
  takenSquares: [10],
  takenCheck: function(clickedSquare){
    return this.takenSquares.some(function(squareNumber) {
      return squareNumber === clickedSquare;
    });  
  },
  turncount:0,
  checkCats: function(){
    if (this.turncount > 8 ){
      this.gameOver ='over';
      return true;
    }
  },
  'playerX': { squares: []},
  playerO : { squares: []},
  turn: 'X',
  assignSquare: function(clickedSquare){
      if ( this.turn === 'X'){
        this['playerX'].squares.push(clickedSquare)
        this.turn = 'O';
      } else {
        this.playerO.squares.push(clickedSquare)
        this.turn = 'X';
      }
      this.turncount ++;
      this.takenSquares.push(clickedSquare) 
      return this['playerX'].squares
  },
  winConditions: {
     con1: [1,2,3],
     con2: [4,5,6],
     con3: [1,4,7],
     con4: [2,5,8],
     con5: [3,6,9],
     con6: [7,8,9],
     con7: [1,5,9],
     con8: [3,5,7]
    },
  winConditionCheck: function(){
    var winMatchesX =0;
    var winMatchesO =0;
    var x ='X';
    var y = 'Y';
    for (var condition in Game.winConditions) {
      winMatchesX =0;
      Game.winConditions[condition].forEach(function(winSquare){
        Game['playerX'].squares.forEach(function(playerSquare){
          if (winSquare === playerSquare) {
            winMatchesX++;
          }
        });
      });
        if (winMatchesX >2){
          this.turncount--;
          this.gameOver = 'over';
          alert('X wins')
          return  'X wins';
        } 
    }
    for (var condition in Game.winConditions) {
    winMatchesO = 0;
    Game.winConditions[condition].forEach(function(winSquare){
    Game.playerO.squares.forEach(function(playerSquare){
          if (winSquare === playerSquare) {
            winMatchesO++;
          }
        });
      });
      if (winMatchesO >2){
        this.turncount --;
        alert('O wins')
        this.gameOver = 'over';
        return 'O wins';
        }
      }
    return 'running';
    }
  };

var Board = {
  create: function(){
    var nBoard = Object.create(Board)
    return this.row1spaces[0]
  },
  row1spaces: [1,2,3],
  row2spaces: [4,5,6],
  row3spaces: [7,8,9]
};



$(document).ready(function(){
   var nBoard = Object.create(Board)
   var nGame = Object.create(Game)
   nBoard.row1spaces.forEach(function(space,index){
      $('tr#row1').append('<td class="'+index+'"></td>')
        $('td').last().click(function(){
          clickedSquare = space;
          console.log(clickedSquare);   
          if (!nGame.takenCheck(clickedSquare)) {
            $(this).html(nGame.turn)
            nGame.fullTurn(clickedSquare)
          } else {
            console.log("wrong")
          }
          if (nGame.gameOver === 'over'){
            $('td').html('');
            nGame['playerX'].squares =[];
            nGame.playerO.squares =[];
            nGame.takenSquares = [];
            nGame.turncount =0;
            nGame.gameOver ='';
            nGame.turn = 'X';
          }
        });
     });
     nBoard.row2spaces.forEach(function(space,index){
      $('tr#row2').append('<td class="'+index+'"></td>')
      $('td').last().click(function(){
         clickedSquare = space; 
         
         if (!nGame.takenCheck(clickedSquare)) {
            $(this).html(nGame.turn)
            nGame.fullTurn(clickedSquare)
          } else {
            console.log("wrong")
          }
            if (nGame.gameOver === 'over'){
            $('td').html('');
            nGame['playerX'].squares =[];
            nGame.playerO.squares =[];
            nGame.takenSquares = [];
            nGame.turncount = 0;
            nGame.gameOver ='';
            nGame.turn = 'X';
          }

      });
    });
    nBoard.row3spaces.forEach(function(space,index){
      $('tr#row3').append('<td class="'+index+'"></td>')
      $('td').last().click(function(){
          clickedSquare = space;
          if (!nGame.takenCheck(clickedSquare)) {
            $(this).html(nGame.turn)
            nGame.fullTurn(clickedSquare)
          } else {
            console.log("wrong")
          }
          if (nGame.gameOver === 'over'){
            $('td').html('');
            nGame['playerX'].squares =[];
            nGame.playerO.squares =[];
            nGame.takenSquares = [];
            nGame.turncount = 0;
            nGame.gameOver ='';
            nGame.turn = 'X';
          }          
          
      });
   });

   
});
