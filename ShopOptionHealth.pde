class ShopOptionHealth extends ShopOption{

  ShopOptionHealth(int pos, int level){
    this.y = pos * 200; 
    price = (int)random(10) * 5;
    power = (int)random(10) * level;
    stock = (int)random(10);
  }

  
  public void buy(Player character){};
  public void display(){};
  
  
}
