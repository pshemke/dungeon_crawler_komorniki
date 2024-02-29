class Banana extends Item{
  Banana(int x, int y){
    name = "Banana";
    icon = get_item(1,15);
    value = 100;
    this.x = x;
    this.y = x;
  }
  
  public void use(Player player){
  player.hp +=7;
  print("potassium.");
  }; 
}
