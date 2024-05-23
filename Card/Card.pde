public class Card{
  private int value;
  private color colr;
  private String name;
  
  public Card(int worth, color colur){
    value = worth;
    colr = colur;
    name = "" + col + " " + worth;
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
}
    
