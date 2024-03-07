class WoodenSword extends Item{
  WoodenSword(int x, int y){
  name = "Wooden Sword";
  icon = get_item(0,5);
  value = 100;
  this.x = x;
  this.y = y;
  }
  
  WoodenSword(WoodenSword copy){
    this.name = copy.name;
    this.icon = copy.icon;
    this.value = copy.value;
    this.x = copy.x;
    this.y = copy.y;
  }
  
  public void use(Player player){player.damage += (int)random(5)+2;};
}
