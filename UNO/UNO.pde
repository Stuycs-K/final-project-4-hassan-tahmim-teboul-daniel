ArrayList<Card> deck;
void setup(){
  size(1000,700);
  deck = new ArrayList<Card>();
  
}

  void mouseClicked(){
    deck.add(new Card(1, color(255,0,0)), mouseX, mouseY);
  }
  void draw(){
    for(Card card:deck){
     card.display();
    }
  }
