class GAME{
  public Deck deck = new Deck();
  public ArrayList<Player> players = new ArrayList<>();
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
    int canplay = cpu.canPlay(mostRecent);
    if (canplay != -1){
      mostRecent = cpu.get(canplay);
      cpu.playCard(cpu.get(canplay));
      pile.add(mostRecent);
    }
    else{
      cpu.drawCard();
    }
       
    
  }
  
  public void playerTurn() {
        Player person = players.get(0);
        Scanner scanner = new Scanner(System.in); // For user input
        boolean playedCard = false;

        for (int i = 0; i < person.getHand().size(); i++) {
            if (person.canPlay(mostRecent, i)) { // Assuming canPlay takes the index as well
                System.out.println("You can play card " + (i + 1));
                System.out.print("Do you want to play this card? (y/n): ");
                String playCard = scanner.nextLine();
                if (playCard.equalsIgnoreCase("y")) {
                    mostRecent = person.get(i);
                    person.playCard(person.get(i));
                    pile.add(mostRecent);
                    playedCard = true;
                    break;
                }
            }
        }
        if (!playedCard) {
            person.drawCard();
        }
    }
  
  
}
