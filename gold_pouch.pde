class GoldPouch extends Item{

  GoldPouch(int x, int y){
    name = "Gold Pouch";
    icon = get_item(11,12);
    value= 100;
    this.x = x;
    this.y = y;
  }
  
Item make_copy(int new_x, int new_y){return new GoldPouch(new_x,new_y);};
  
    

  public void use(Player player){player.gold += (int)random(5)+7;};
}
