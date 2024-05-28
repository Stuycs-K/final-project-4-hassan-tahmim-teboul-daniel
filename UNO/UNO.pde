ArrayList<Card> deck;
void setup(){
  
  size(1000,700);
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
  
  
}

  void mouseClicked(){
    deck.add(new Card(mouseX % 10, color(255,0,0), mouseX, mouseY));
  }
  void draw(){
    for(Card card:deck){
     card.display();
    }
  }
