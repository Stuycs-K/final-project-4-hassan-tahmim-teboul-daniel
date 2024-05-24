 class Card{
  private int x,y;
  private int value;
  private color colr;
  private String name;
  
  public Card(){
    value = -1;
    colr = color(0);
    name = "";
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
  
  public int getValue(){
    return value;
  }
  
  public color getColor(){
    return colr;
  }
  
  public String getName(){
    return name;
  }
  void display(){
    fill(colr);
    rect(x, y, 126,200);
    text(value, x+20, y + 20);
  }
}
    
