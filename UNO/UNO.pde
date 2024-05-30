public UNO game;

void setup() {
  size(1000, 700);
  game = new UNO();
}

void draw() {
  game.draw();
}

void mouseClicked() {
  game.mouseClicked();
}

class UNO {
  
  private Deck deck;
  
  public UNO(){
    deck = new Deck();
  }
  
  void mouseClicked(){
    deck.add(new Card(mouseX % 10, color(255,0,0), mouseX, mouseY));
  }
  
  void draw(){
    for(Card card:deck){
     card.display();
    }
  }
}
