
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
    
