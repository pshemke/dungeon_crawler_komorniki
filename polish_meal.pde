class PolishMeal extends Item{
  PolishMeal(int x, int y){
    name = "Polish Meal";
    icon = get_item(19,6);
    value = 100;
    this.x = x;
    this.y = x;
  }
  
  PolishMeal(PolishMeal copy){
    this.name = copy.name;
    this.icon = copy.icon;
    this.value = copy.value;
    this.x = copy.x;
    this.y = copy.y;
  }
  
  public void use(Player player){
  player.hp +=20;
  player.defence -=2;
  }; 
}
