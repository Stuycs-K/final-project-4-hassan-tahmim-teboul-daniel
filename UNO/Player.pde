public class Player{
  private ArrayList<Card> hand;
  private String name;
  
  public Player(Deck deck){
   hand = new ArrayList<Card>();
   for (int i = 0; i < 7; i++){
      hand.add(deck.remove((int) (Math.random() * deck.size())));
    }
   sortHand();
  }
  
  public Player(Deck deck, String name){
    Player(deck);
    this.name = name;
  }
  
  public ArrayList<Card> getHand(){
    return hand;
  }
  
  public int canPlay(Card played){
    for (int i = 0; i < hand.length; i++){
      if (hand.get(i).isValid(played)){
        return i;
      }
    }
    return -1;
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
 public Card get(int index){
  return hand.get(index); 
 }
}
    
