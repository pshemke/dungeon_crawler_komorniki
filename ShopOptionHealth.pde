class ShopOptionHealth extends ShopOption{

  ShopOptionHealth(int pos, int level){
    this.y = pos * 200; 
    price = (int)random(10) * 5 + 10;
    power = (int)random(10) * level + 2;
    stock = (int)random(10) + 1;
  }

  
  public void buy(Player character){
    if(character.gold >= price){
     character.hp += power;
     character.gold -= price;
     stock--;
    }
    };
     
  public void display(){
    fill(50);
    rect(this.x,this.y,this.button_width, this.button_height);
    fill(255);
    text("Cost: " + this.price, this.x + 20, this.y +70);
    text("Extra Health: " + this.power, this.x + 170, this.y +70); //effect
    text("Stock: " + this.stock, this.x + 420, this.y +70);
  };
  
  
}
