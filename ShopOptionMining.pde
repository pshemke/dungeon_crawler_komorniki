class ShopOptionMining extends ShopOption{

  ShopOptionMining(int pos, int level){
    this.y = pos * 200; 
    price = (int)random(10) * 3;
    power = (int)random(10) * level;
    stock = (int)random(5);
  }

  
  public void buy(Player character){
    if(character.gold >= price && stock > 0 && character.mining < 100){
     character.mining += power;
     character.gold -= price;
     stock--;
     if(character.mining > 100)
     println("that level of mining would be too OP");
    }
  };
  public void display(){
    fill(50);
    rect(this.x,this.y,this.button_width, this.button_height);
    text("Cost: " + this.price, this.x + 20, this.y + 20); 
    text("Extra Mining: " + this.power, this.x + 200, this.y + 20); //effect
    text("Stock: " + this.stock, this.x + 500, this.y + 20); 
  };
  
  
}
