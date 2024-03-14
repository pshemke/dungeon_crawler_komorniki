class Banana extends Item{
  Banana(int x, int y){
    name = "Banana";
    icon = get_item(1,14);
    value = 100;
    this.x = x;
    this.y = x;
  }
  
  Item make_copy(int new_x, int new_y){return new Banana(new_x, new_y); };
  
  public void use(Player player){
  player.hp +=7;
  print("potassium.");
  }; 
}
