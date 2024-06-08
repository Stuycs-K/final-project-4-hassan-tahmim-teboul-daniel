class Card implements Comparable<Card>{
  PImage carddisplay;
  private int x,y;
  private int value;
  private color colr;
  private String name;
  
  public Card(){
    value = -1;
    colr = color(0);
    name = "";
  }
    public Card(int worth, color colur){
    value = worth;
    colr = colur;
    String cols = "";
    if (colr == color(255,51,51)){
     cols = "red"; 
    }if (colr == color(255,255,51)){
     cols = "yellow"; 
    }if (colr == color(51,51,255)){
     cols = "blue"; 
    }if (colr == color(51,255,51)){
     cols = "green"; 
    }
    String[] cards = {"Skip", "Reverse", "Draw2", "draw4", "wildcard"};
    if (worth < 10){
      name = "" + cols + worth;
    }
    else if(worth < 13){
      name = "" + cols +cards[worth - 10];
    }
    else{
      name = cards[worth-10];
    }
    x = 0;
    y = 0;
    }
    
    public Card(int worth){
      value = worth;
      colr = color(0);
      if (worth == 13){
        name = "draw4";
      }
      else if (worth == 14){
        name = "wildcard";
      }
    }
  
  public Card(int worth, color colur, int xs, int ys){
    value = worth;
    colr = colur;
    name = "" + colur + " " + worth;
    x = xs;
    y = ys;
  }
  public void setx(int newx){
    x = newx;
  }
  public void sety(int newy){
    y = newy;
  }
  public void setColor(color colur){
    colr = colur;
  }
  
  public int getValue(){
    return value;
  }
  
  public color getColor(){
    return colr;
  }
  
  public String getName(){
    return name;
  }
  
  public void setName(String name){
    this.name = name;
  }
  
  public boolean isValid(Card other){
    return(this.getColor() == other.getColor() || this.getValue() == other.getValue() || this.getValue() > 12) || other.getValue() > 12;
  }
  
  @Override
  public int compareTo(Card other){
    if (this.colr != other.getColor()){
      return this.colr - other.getColor();
    }
    else{
      return this.value - other.getValue();
    }
  }
 
  

  void display(int x, int y) {
    carddisplay = loadImage("Images/" + getName() + ".jpg");
    rectMode(CORNER);

   image(carddisplay, x ,y ,50, 70);
  }
}
    
