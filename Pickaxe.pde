class Pickaxe extends Item{

  Pickaxe(int x, int y){
    name = "Pickaxe";
    icon = get_item(8,2);
    value= 100;
    this.x = x;
    this.y = y;
  }
  
    Pickaxe(Pickaxe copy){
    this.name = copy.name;
    this.icon = copy.icon;
    this.value = copy.value;
    this.x = copy.x;
    this.y = copy.y;
  }
  
    

  public void use(Player player){player.mining +=2;};
}
