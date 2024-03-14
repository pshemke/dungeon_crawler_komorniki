class WoodenSword extends Item{
  WoodenSword(int x, int y){
  name = "Wooden Sword";
  icon = get_item(0,5);
  value = 100;
  this.x = x;
  this.y = y;
  }
  
  Item make_copy(int new_x, int new_y){return new WoodenSword(new_x,new_y); };
  
  public void use(Player player){player.damage += (int)random(5)+2;};
}
