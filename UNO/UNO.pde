ArrayList<Card> deck;

void setup(){
  
  size(1000,700);
  
  
}

  void mouseClicked(){
    deck.add(new Card(mouseX % 10, color(255,0,0), mouseX, mouseY));
  }
  void draw(){
    for(Card card:deck){
     card.display();
    }
  }
