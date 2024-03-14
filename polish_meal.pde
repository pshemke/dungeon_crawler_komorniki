class PolishMeal extends Item{
  PolishMeal(int x, int y){
    name = "Polish Meal";
    icon = get_item(6,19);
    value = 100;
    this.x = x;
    this.y = x;
  }
  
  Item make_copy(int new_x, int new_y){return new PolishMeal(new_x,new_y); };
  
  public void use(Player player){
  player.hp +=20;
  player.defence -=2;
  }; 
}
