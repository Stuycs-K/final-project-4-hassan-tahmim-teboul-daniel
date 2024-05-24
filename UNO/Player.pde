class Player{
  private ArrayList<Card> hand;
  
  public Player(ArrayList<Card> deck){
    for (int i = 0; i < 7; i++){
      hand.add(deck.remove(Math.random() * 109));
    }
    hand.sortHand();
  }
/*  
  public void sortHand(){
    ArrayList<Card> shuffled = new ArrayList<>(hand.length);
  }
  
  public Card playCard(){
  }
  */
  }
    
