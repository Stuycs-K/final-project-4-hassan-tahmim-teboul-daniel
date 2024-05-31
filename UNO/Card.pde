class Card implements Comparable<Card>{
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
    name = "" + colur + " " + worth;
    x = 0;
    y = 0;
    }
    
    public Card(int worth){
      value = worth;
      colr = color(0);
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
  
  public boolean isValid(Card other){
    return(this.getColor() == other.getColor() || this.getValue() == other.getValue() || this.getValue() > 12);
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
 
  

  void display(){
    fill(colr);
    rect(x - 28, y - 43, 56,86);
    textSize(23);
    fill(255,255,255);
    text(value, x - 7, y + 10);
    textSize(5);
    text(value, x - 13,y - 20);
    text(value, x + 13, y + 20);
    text(value, x + 13, y - 20);
    text(value, x - 13, y + 20);
    
  }
}
    
