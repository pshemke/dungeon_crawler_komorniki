class Pickaxe extends Item{

  Pickaxe(int x, int y){
    name = "Pickaxe";
    icon = get_item(8,2);
    value= 100;
    this.x = x;
    this.y = y;
  }
    

  public void use(Player player){player.mining +=2;};
}
