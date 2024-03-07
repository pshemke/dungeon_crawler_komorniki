class Banana extends Item{
  Banana(int x, int y){
    name = "Banana";
    icon = get_item(1,15);
    value = 100;
    this.x = x;
    this.y = x;
  }
  
  Banana(Banana copy){
    this.name = copy.name;
    this.icon = copy.icon;
    this.value = copy.value;
    this.x = copy.x;
    this.y = copy.y;
  }
  
  public void use(Player player){
  player.hp +=7;
  print("potassium.");
  }; 
}
