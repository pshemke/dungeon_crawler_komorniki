class GoldPouch extends Item{

  GoldPouch(int x, int y){
    name = "Gold Pouch";
    icon = get_item(12,11);
    value= 100;
    this.x = x;
    this.y = y;
  }
    

  public void use(Player player){player.gold += (int)random(20)+10;};
}
