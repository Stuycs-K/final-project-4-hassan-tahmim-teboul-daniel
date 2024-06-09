
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
  
  
 
  
  public void setupHands(){
  
   players.add(new Player(deck, "Player 1"));
   players.add(new Player(deck, "CPU"));  //players index 1, cpu
   players.add(new Player(deck, "CPU2"));  //players index 1, cpu
   players.add(new Player(deck, "CPU3"));  //players index 1, cpu

   
  }
  
  public void cpuTurn(){
    if (game){
    Player cpu = players.get(whosTurn % 4);
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

    Desk = loadImage("Images/redBackground.jpg");
    Deck = loadImage("Images/drawCard.jpg");
    back = loadImage("Images/unoCard.jpg");
    back1 = loadImage("Images/unoCard -Copy1.jpg");
    back2 = loadImage("Images/unoCard -Copy.jpg");
    unoSymbol = loadImage("Images/unoSymbol.png");


    setupHands();
    mostRecent = deck.remove(0);
    while (mostRecent.getValue() >= 10){ //change later so that no specials are played first, put back into deck as well
      mostRecent=deck.remove(0);
      
    }
    pile.add(mostRecent);
    

  }
  
  public void draw() {
    image(Desk,0,0, width, height);


    int handX = 200; 
    int handY = 50; 
    for (Card card : players.get(2).getHand()) {
      if(card != null){
        image(back, handX, handY, 50, 70);
      handX += 60; 
      }
    }
    handY = height - 80;
    handX = 200;
    for (Card card : players.get(0).getHand()) {
      if( card != null){
        card.display(handX, handY);
        handX += 60;
      }
    }
    handX = 10;
    handY = 80;
    for (Card card : players.get(3).getHand()) {
      if(card != null){
        image(back1, handX, handY, 50, 70);
        handY += 50; 
      }
    }
    handX = width - 70;
    handY = 80;
    for (Card card : players.get(1).getHand()) {
      if(card != null){
        image(back1, handX, handY, 50, 70);
        handY += 50; 
      }
    }

    int deckX = width - 60; 
    int deckY = height - 80; 
    image(Deck, deckX, deckY, 50, 70);
    
    if (whosTurn % 4 != 0 && frameCount % 50 == 0) {
    cpuTurn();
    }


    if (!pile.isEmpty()) {
      int pileX = width / 2 - 25;
      int pileY = height / 2 - 30; 
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
    int handX = 200; 
    int cardWidth = 50; 
    int cardHeight = height - 80;
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
            image(unoSymbol, width/2,height/2, 200, 200);
            game = false; // End the game
            return;
        }

        // Skip and Reverse both act the same: skip the other player's turn (will change when adding more people)
        if (mostRecent.getValue() == 10) { 
            whosTurn = (whosTurn + 2)  % players.size();
        } else {
            if(mostRecent.getValue() == 11){
             clockwise = !clockwise; 
            }
            if (clockwise){
              if (whosTurn == 0){
                whosTurn = 3;
              }
              else{
              whosTurn = (whosTurn - 1) % players.size();
              }
            }
            else{
            whosTurn = (whosTurn + 1) % players.size();
          }
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

  

  
  
  
