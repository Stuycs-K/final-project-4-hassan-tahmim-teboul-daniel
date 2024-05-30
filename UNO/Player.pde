public class Player{
  private ArrayList<Card> hand;
  
  public Player(Deck deck){
   hand = new ArrayList<Card>();
   for (int i = 0; i < 7; i++){
      hand.add(deck.remove((int) (Math.random() * deck.size())));
    }
   sortHand();
  }

  public void sortHand(){
    Collections.sort(hand);
  }  
  public Card playCard(Card chosen){
    return hand.remove(chosen);
  }
  public Card drawCard(){
    return hand.add((deck.remove((int) (Math.random() * deck.size()))));
 }
}
    
