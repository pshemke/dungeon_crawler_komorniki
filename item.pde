PImage get_item(int x, int y){
 return item_sheet.get(32*x,32*y,32,32); 
}

class Item{
  String name = "";
  PImage icon;
  int value = 0;
  
  int number = 1;
  Boolean stackable = false;
  
  int x;
  int y;
  
  public void use(Player player){};
  public void disp_map(){
  image(icon, x*32, y*32);
  };
  public void disp_back(){};
  
}
