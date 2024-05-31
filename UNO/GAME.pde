class GAME{
  public Deck deck = new Deck();
  public ArrayList<Player> players = new ArrayList<Player>();
  public boolean clockwise = true; //game starts out clockwise
  public ArrayList<Card> playerhand = new ArrayList<Card>();
  public ArrayList<Card> cpuhand = new ArrayList<Card>();
  public int whosTurn = 1;
  public int numTurns = 0;
  public boolean game = true;
  
  
  
  public void turn(){
    while(game){
      if (whosTurn == 1){
        playerTurn();
      }else{
        cpuTurn();
        
      }   
    
   numTurns ++;
   if(whosTurn < players.size()){
     whosTurn++;
   }
     else{
       whosTurn = 1;
     }
  }
  }
  
  public void setupHands(){
   players.add(new Player(deck));
   players.add(new Player(deck));

   
  }
  
  public void cpuTurn(){
    
    
  }
  
  public void playerTurn(){
    Player person = players.get(0);
    for(int i = 0; i < person.getHand().size(); i++){
     if (person.canPlay(mostRecent) == -1){
        players.get(0).drawCard();      
     }else{
            
     }
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
