ArrayList<Card> deck;
color red = color(255,51,51);
color yellow = color(255,255,51);
color blue = color(51,51,255);
color green = color(51,255,51);
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
