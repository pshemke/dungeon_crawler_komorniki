class GoldPouch extends Item{

  GoldPouch(int x, int y){
    name = "Gold Pouch";
    icon = get_item(11,12);
    value= 100;
    this.x = x;
    this.y = y;
  }
  
   GoldPouch(GoldPouch copy){
    this.name = copy.name;
    this.icon = copy.icon;
    this.value = copy.value;
    this.x = copy.x;
    this.y = copy.y;
  }
  
    

  public void use(Player player){player.gold += (int)random(5)+7;};
}
