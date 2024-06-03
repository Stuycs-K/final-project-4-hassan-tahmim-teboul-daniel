
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
      }   
    
   numTurns ++;
     
  }
  }
  
  public void setupHands(){
  
   players.add(new Player(deck, "Player 1"));
   players.add(new Player(deck, "CPU"));  //players index 1, cpu

   
  }
  
  public void cpuTurn(){
    if (game){
    Player cpu = players.get(1);
    int canplay = cpu.canPlay(mostRecent);
    if (canplay != -1) {
        Card chosen = cpu.get(canplay);
        playCard(chosen, cpu); 
    }
    else{
      cpu.drawCard(deck);
    }
       
    }
  }
  

    public void setup() {
    size(1600, 600);
    setupHands();
    mostRecent = deck.remove(0);
    while (mostRecent.getValue() >= 10){ //change later so that no specials are played first, put back into deck as well
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
    handY = height - 80;
    handX = 10;
    for (Card card : players.get(1).getHand()) {
      card.display(handX, handY);
      handX += 60; 
    }


    int deckX = width - 60; 
    int deckY = height - 80; 
    fill(128); 
    rect(deckX, deckY, 50, 70);
    textAlign(CENTER, CENTER);
    text("DECK", deckX + 25, deckY + 35);
    if (whosTurn == 1 && frameCount % 150 == 0) {
    cpuTurn();
    }


    if (!pile.isEmpty()) {
      int pileX = width / 2 - 25;
      int pileY = 150; 
      pile.get(pile.size() - 1).display(pileX, pileY); //displays the last card in the pile( so the card that needs to be compared to
    }
  }
  void mouseClicked(){
    if (whosTurn == 0 && game) {
      if (mouseX >= width - 60 && mouseX <= width - 10 &&
          mouseY >= height - 80 && mouseY <= height - 10) {
        players.get(0).drawCard(deck);
      } else {
        int cardIndex = checkCardClicked();
        if (cardIndex != -1) {
          Card chosecard = players.get(whosTurn).get(cardIndex);
          playCard(chosecard, players.get(0));

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
 private void playCard(Card chosenCard, Player player) {
    if (chosenCard.isValid(mostRecent)) { 
        mostRecent = chosenCard;
        player.playCard(chosenCard); 
        pile.add(mostRecent);

        if (player.getHand().isEmpty()) {
            System.out.println(player.name + " wins!");
            game = false; // End the game
            return;
        }

        // Skip and Reverse both act the same: skip the other player's turn (will change when adding more people)
        if (mostRecent.getValue() == 10 || mostRecent.getValue() == 11) { 
            whosTurn = whosTurn;
        } else {
            whosTurn = (whosTurn + 1) % players.size();
        }

        if (mostRecent.getValue() == 12) { // Draw 2
            Player nextPlayer = players.get(whosTurn);
            nextPlayer.drawCard(deck);
            nextPlayer.drawCard(deck);
        } else if (mostRecent.getValue() == 13) { // Draw 4
            Player nextPlayer = players.get(whosTurn);
            for (int i = 0; i < 4; i++) {
                nextPlayer.drawCard(deck);
            }
        }

    } else {
        System.out.println("Invalid move. Please try again.");
    }
}

  

  
  
  
