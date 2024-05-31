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
   ArrayList<Card> playerhand = players.get(0).getHand();
   ArrayList<Card> cpuhand = players.get(1).getHand();
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
