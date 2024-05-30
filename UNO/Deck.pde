public class Deck{
  color red = color(255,51,51);
  color yellow = color(255,255,51);
  color blue = color(51,51,255);
  color green = color(51,255,51);
  public Deck(){
    color red = color(255,51,51);
    color yellow = color(255,255,51);
    color blue = color(51,51,255);
    color green = color(51,255,51);
    ArrayList<color> colorList = new ArrayList<color> {red, yellow, blue, green, red, yellow, blue, green};
  deck = new ArrayList<Card>();
  
  //numbered cards
  for (int i = 0; i < 8;i++){
    for (int j = 0; j < 10; j++){
      deck.add(new Card(j, colorList.get(i)));
    }
  }
  
  //special cards
  
  //skip, reverse, draw 2
  for (int i = 0; i < 8; i++){
    for (int j = 10; j < 13; j++){
      deck.add(new Card(j, colorList.get(i)));
    }
  }
  
  //draw 4, wild card
  for (int i = 0; i < 4;i++){
    deck.add(new Card(13)); //draw4
    deck.add(new Card(14)); //wildcard
  }
  }
}
