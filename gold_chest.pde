class GoldChest extends Item{

  GoldChest(int x, int y){
    name = "Gold Chest";
    icon = get_item(11,11);
    value= 100;
    this.x = x;
    this.y = y;
  }
  
   GoldChest(GoldChest copy){
    this.name = copy.name;
    this.icon = copy.icon;
    this.valu = copy.value;
    this.x = copy.x;
    this.y = copy.y;
  }
  
    

  public void use(Player player){player.gold += (int)random(130)+100;};
}
