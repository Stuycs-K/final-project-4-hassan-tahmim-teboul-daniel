class Player{
  private ArrayList<Card> hand;
  private String name;
  
  public Player(Deck deck){
   hand = new ArrayList<Card>();
   for (int i = 0; i < 7; i++){
      hand.add(deck.remove(0));
    }
   sortHand();
  }
  
  public Player(Deck deck, String name){
    hand = new ArrayList<Card>();
   for (int i = 0; i < 7; i++){
      hand.add(deck.remove(0));
    }
   sortHand();
    this.name = name;
  }
  
  public ArrayList<Card> getHand(){
    return hand;
  }
  
  public int canPlay(Card played){
    for (int i = 0; i < hand.size(); i++){
      if (hand.get(i).isValid(played)){
        return i;
      }
    }
    return -1;
  }
  public boolean canPlay(Card played, int i){
    return hand.get(i).isValid(played);
  }

  public void sortHand(){
    Collections.sort(hand);
  }  
  public void playCard(Card chosen){
    hand.remove(chosen);
  }
  public Card drawCard(Deck deck){
    Card newCard = (deck.remove(0));
    hand.add(newCard);
    return newCard;
 }
 public Card get(int index){
  return hand.get(index); 
 }
}
    
