class GoldChest extends Item{

  GoldChest(int x, int y){
    name = "Gold Chest";
    icon = get_item(11,11);
    value= 100;
    this.x = x;
    this.y = y;
  }
    

  public void use(Player player){player.gold += (int)random(150)+250;};
}
