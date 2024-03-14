class ConvertersDagger extends Item{
  ConvertersDagger(int x, int y){
    name = "Converter's Dagger";
    icon = get_item(7,5);
    value = 100;
    this.x = x;
    this.y = x;
  }
  
  Item make_copy(int new_x, int new_y){return new ConvertersDagger(new_x,new_y); };
  
  public void use(Player player){
  player.damage +=5;
  player.hp -=4;
  }; 
}
