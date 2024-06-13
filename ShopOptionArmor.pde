class ShopOptionArmor extends ShopOption{

  ShopOptionArmor(int pos, int level){
    this.y = pos * 200; 
    price = (int)random(10) * 5;
    power = (int)random(10) * level;
    stock = (int)random(10);
  }

  
  public void buy(Player character){
    if(character.gold >= price){
     character.defence += power;
     character.gold -= price;
     stock--;
    }
    };
     
  public void display(){
    fill(50);
    rect(this.x,this.y,this.button_width, this.button_height);
    fill (#FFFFFF);
    text("Cost: " + this.price, this.x + 40, this.y +80);
    text("Extra Armor: " + this.power, this.x + 180, this.y +80); //effect
    text("Stock: " + this.stock, this.x + 440, this.y +80);
  };
  
  
}
