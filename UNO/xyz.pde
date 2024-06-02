
  public Deck deck = new Deck();
  public ArrayList<Player> players = new ArrayList<Player>();
  public boolean clockwise = true; //game starts out clockwise
  public ArrayList<Card> playerhand = new ArrayList<Card>();
  public ArrayList<Card> cpuhand = new ArrayList<Card>();
  public int whosTurn = 0;
  public int numTurns = 0;
  public boolean game = true;
  public Card mostRecent;
  public ArrayList<Card> pile = new ArrayList<Card>();
  
  
  
  public void turn(){
    while(game){
      if (whosTurn == 1){
        cpuTurn();
        whosTurn = 0;
      }   
    
   numTurns ++;
     
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
      playCard(mostRecent);
      pile.add(mostRecent);
    }
    else{
      cpu.drawCard(deck);
    }
       
    
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
    for (Card card : players.get(0).getHand()) {
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
      pile.get(pile.size() - 1).display(pileX, pileY); //displays the last card in the pile( so the card that needs to be compared to
    }
  }
  void mouseClicked(){
    if (whosTurn == 0) {
      if (mouseX >= width - 60 && mouseX <= width - 10 &&
          mouseY >= height - 80 && mouseY <= height - 10) {
        players.get(0).drawCard(deck);
        whosTurn = 1;
      } else {
        int cardIndex = checkCardClicked();
        if (cardIndex != -1) {
          Card chosecard = players.get(whosTurn).get(cardIndex);
          playCard(chosecard);
          whosTurn = 1;

        }
      }
    }
  }
  private int checkCardClicked() {
    int handX = 10; 
    int cardWidth = 50; 
    int cardHeight = 70;
    for (int i = 0; i < players.get(0).getHand().size(); i++) {
      if (mouseX >= handX && mouseX <= handX + cardWidth &&
          mouseY >= 50 && mouseY <= 50 + cardHeight) {
        return i;
      }
      handX += 60; 
    }
    return -1;
  }
  private void playCard(Card chosenCard) {
    if (chosenCard.isValid(mostRecent)) {
      mostRecent = chosenCard;
      players.get(whosTurn).playCard(mostRecent);
      pile.add(mostRecent);
      if (players.get(whosTurn).getHand().isEmpty()) {
        System.out.println(players.get(whosTurn).name + " wins!");
        game = false; // End the game
      }
    } else {
      System.out.println("Invalid move. Please try again.");
    }
  }
  
  
  
