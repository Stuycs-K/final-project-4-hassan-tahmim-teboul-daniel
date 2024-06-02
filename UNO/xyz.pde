
  public Deck deck = new Deck();
  public ArrayList<Player> players = new ArrayList<Player>();
  public boolean clockwise = true; //game starts out clockwise
  public ArrayList<Card> playerhand = new ArrayList<Card>();
  public ArrayList<Card> cpuhand = new ArrayList<Card>();
  public int whosTurn = 1;
  public int numTurns = 0;
  public boolean game = true;
  public Card mostRecent;
  public ArrayList<Card> pile = new ArrayList<Card>();
  
  
  
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
    int canplay = cpu.canPlay(mostRecent);
    if (canplay != -1){
      mostRecent = cpu.get(canplay);
      cpu.playCard(cpu.get(canplay));
      pile.add(mostRecent);
    }
    else{
      cpu.drawCard(deck);
    }
       
    
  }
  
  public void playerTurn() {
        
    }
    public void setup() {
    size(800, 600);
    setupHands();
    mostRecent = deck.remove(0);
    while (mostRecent.getValue() >= 13){
      mostRecent=deck.remove(0);
      
    }
    pile.add(mostRecent);
  }
  
  public void draw() {
    background(255);


    int handX = 10; 
    int handY = 50; 
    for (Card card : players.get(whosTurn).getHand()) {
      card.display(handX, handY);
      handX += 60; 
    }


    int deckX = width - 60; 
    int deckY = height - 80; 
    fill(128); 
    rect(deckX, deckY, 50, 70);
    textAlign(CENTER, CENTER);
    text("DECK", deckX + 25, deckY + 35);


    if (!pile.isEmpty()) {
      int pileX = width / 2 - 25;
      int pileY = 150; 
      pile.get(pile.size() - 1).display(pileX, pileY); 
    }
  }
  
  
