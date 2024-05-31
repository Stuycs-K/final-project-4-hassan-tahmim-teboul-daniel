class GAME{
  public Deck deck = new Deck();
  public ArrayList<Player> players = new ArrayList<Player>();
  public boolean clockwise = true; //game starts out clockwise
  public ArrayList<Card> playerhand = new ArrayList<Card>();
  public ArrayList<Card> cpuhand = new ArrayList<Card>();
  public int whosTurn = 1;
  public int numTurns = 0;
  public boolean game = true;
  public Card mostRecent;
  public ArrayList<Card> pile;
  
  
  
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

   players.add(new Player(deck, "Player 1"));
   players.add(new Player(deck, "CPU"));  //players index 1, cpu

   
  }
  
  public void cpuTurn(){
    Player cpu = players.get(1);
    if (cpu.canPlay(mostRecent) != -1){
      mostRecent = cpu.get(cpu.canPlay());
      cpu.playCard(cpu.get(cpu.canPlay()));
      pile.add(mostRecent);
    }
    else{
      cpu.drawCard();
    }
       
    
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
