/*class Player{
  private ArrayList<Card> hand;
  
  public Player(ArrayList<Card> deck){
   hand = new ArrayList<Card>();
   for (int i = 0; i < 7; i++){
      hand.add(deck.remove((int) (Math.random() * deck.size())));
    }
   sortHand();
  }

  public void sortHand(){
    Collections.sort(hand);
  }  
  public Card playCard(){
  }
 }
    
