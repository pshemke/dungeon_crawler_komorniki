class ConvertersDagger extends Item{
  ConvertersDagger(int x, int y){
    name = "Converter's Dagger";
    icon = get_item(7,5);
    value = 100;
    this.x = x;
    this.y = x;
  }
  
  public void use(Player player){
  player.damage +=5;
  player.hp -=4;
  }; 
}
