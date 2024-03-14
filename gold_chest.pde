class GoldChest extends Item{

  GoldChest(int x, int y){
    name = "Gold Chest";
    icon = get_item(11,11);
    value= 100;
    this.x = x;
    this.y = y;
  }
  
Item make_copy(int new_x, int new_y){return new GoldChest(new_x,new_y);};
    

  public void use(Player player){player.gold += (int)random(130)+100;};
}
