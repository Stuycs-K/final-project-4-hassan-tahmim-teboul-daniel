
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
  public int mode = 0;
  
  
 
  
  public void setupHands(){
   players.add(new Player(deck, "Player 1"));
   players.add(new Player(deck, "Spider"));  //players index 1, cpu
   players.add(new Player(deck, "Donald"));  //players index 2, cpu
   players.add(new Player(deck, "Harley"));  //players index 3, cpu
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
      if (deck.size() == 0){
        deck = new Deck();
    }
      cpu.drawCard(deck);
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
    }
    }
  

    public void setup() {
    size(1600, 1000);

    Desk = loadImage("Images/redBackground.jpg");
    Deck = loadImage("Images/drawCard.jpg");
    back = loadImage("Images/unoCard.jpg");
    back1 = loadImage("Images/unoCard -Copy1.jpg");
    back2 = loadImage("Images/unoCard -Copy.jpg");
    unoSymbol = loadImage("Images/unoSymbol.png");
    star = loadImage("Images/star.png");
    rightArrow = loadImage("Images/arrow2.png");
    verticalArrow = loadImage("Images/verticalArrow.png");
    clock = loadImage("Images/clockwise.png");
    counterClock = loadImage("Images/counterClock.png");
    avatar1 = loadImage("Images/avatar1.png");
    avatar2 = loadImage("Images/avatar2.png");
    avatar3 = loadImage("Images/avatar3.png");
    avatar4 = loadImage("Images/avatar4.png");
    playButton = loadImage("Images/playButton.png");


    setupHands();
    mostRecent = deck.remove(0);
    while (mostRecent.getValue() >= 10){ //change later so that no specials are played first, put back into deck as well
      mostRecent=deck.remove(0);
    }
    pile.add(mostRecent);
  }
  
  
  
  
  
  public void draw() {
    
    //basic map images
    image(Desk,0,0, width, height);

    if (mode == 1){
    if (whosTurn == 0){
      image(star, 80, height - 250, 100, 100);
    }
    else if (whosTurn == 3){
      image(star,80,200,100,100);
    }
    else if (whosTurn == 2){
      image(star, 360, 130, 100, 100);
    }
    else if (whosTurn == 1){
      image(star, width - 195, 200, 100, 100);
    }
    if (whosTurn == 0 && players.get(0).canPlay(mostRecent) == -1){
      image(rightArrow, width - 190, height - 80, 120, 60);
      image(verticalArrow,width - 67,height - 210, 60, 120);
    }
    
    if (clockwise){
      image(clock, (width / 2) - 100, (height / 2) - 90, 200, 200);
    }
    else{
      image(counterClock, (width / 2) - 100, (height / 2) - 90, 200, 200);
    }


    //start setting up players
    //player at top of screen
    int handX = 300; 
    int handY = 50; 
    fill(255);
    rect(180, 10, 100 ,25);
    textSize(20);
    fill(0);
    text("Donald", 200, 30);
    image(avatar2, 180, 37, 100, 100);
    int x = 1;
    for (Card card : players.get(2).getHand()) {
      if(card != null && x < 20){
        image(back, handX, handY, 50, 70);
      handX += 60; 
      }
      x++;
    }
    
    
    //your player
    handY = height - 80;
    handX = 200;
    fill(255);
    rect(80,height - 130, 100, 25);
    textSize(20);
    fill(0);
    text("Batman", 95, height - 110);
    image(avatar1, 80, height - 103, 100, 100);
    for (Card card : players.get(0).getHand()) {
      if( card != null){
        if (handX >= 1440){
          handX = 200;
          handY -= 100;
        }
        if (whosTurn == 0 && card.isValid(mostRecent)){
          card.display(handX, handY - 20);
        }
        else{
          card.display(handX, handY);
        }
        handX += 60;
      }
    }
    
    
    //left handside player
    handX = 10;
    handY = 200;
    fill(255);
    rect(10,70, 100, 25);
    fill(0);
    text("Harley", 35,90);
    image(avatar3, 10, 97, 100, 100);
    int i = 1;
    for (Card card : players.get(3).getHand()) {
      if(card != null && i < 15){
        image(back1, handX, handY, 50, 70);
        handY += 50; 
      }
      i++;
    }
    
    
    //right handside player
    handX = width - 70;
    handY = 200;
    fill(255);
    rect(width - 120,70, 100, 25);
    fill(0);
    text("Spider", width - 95,90);
    image(avatar4, width - 120, 97, 100, 100);
    int j = 1;
    for (Card card : players.get(1).getHand()) {
      if(card != null && j < 15){
        image(back1, handX, handY, 50, 70);
        handY += 50; 
      }
      j++;
    }
    
    
    //draw card in bottom right
    int deckX = width - 60; 
    int deckY = height - 80; 
    image(Deck, deckX, deckY, 50, 70); 
    
    
    //cpu turns
    if (whosTurn % 4 != 0 && frameCount % 50 == 0) {
    cpuTurn();
    }
    
    //displays the last card in the pile
    if (!pile.isEmpty()) {
      int pileX = width / 2 - 25;
      int pileY = height / 2 - 30; 
      pile.get(pile.size() - 1).display(pileX, pileY); 
    }
    
    //show uno symbol when game ends
    if (!game){
      image(unoSymbol, width/2,height/2, 500, 500); 
    }
    
    if (!game){
      image(unoSymbol, width/2,height/2, 500, 500);
    }
    }
    if (mode == 0){
      image(unoSymbol, 500, 100, 600, 500);
      image(playButton, 650 , 700, 300, 250);  
      
    }
  }
  //end of draw()
  
  
  
  
  
  void mouseClicked(){
    if (mode == 1 && whosTurn == 0 && game ) {
      if (mouseX >= width - 60 && mouseX <= width - 10 &&
          mouseY >= height - 80 && mouseY <= height - 10) {
            if (deck.size() == 0){
              deck = new Deck();
            }
        players.get(0).drawCard(deck);
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
       
      
      else {
        int cardIndex = checkCardClicked();
        if (cardIndex != -1) {
          Card chosecard = players.get(whosTurn).get(cardIndex);
          playCard(chosecard, players.get(0));
        }
      }
    }
    if (mode == 0){ 
      if(mouseX >= 650 && mouseX <= 950 && 
        mouseY >= 700 && mouseY <= 950){
         mode = 1; 
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
            
            game = false; // End the game
            return;
        }
        if (mostRecent.getValue() == 0){
          
         if (clockwise){
           ArrayList<Card> temphand = players.get(0).getHand();
           players.get(0).setHand(players.get(1).getHand());
           players.get(1).setHand(players.get(2).getHand());
           players.get(2).setHand(players.get(3).getHand());
           players.get(3).setHand(temphand);
         }else{
           ArrayList<Card> temphand = players.get(0).getHand();
           players.get(0).setHand(players.get(3).getHand());
           players.get(3).setHand(players.get(2).getHand());
           players.get(2).setHand(players.get(1).getHand());
           players.get(1).setHand(temphand);
         }
        }

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

  

  
  
  
