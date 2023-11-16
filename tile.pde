public class Tile{
  Tiles type;
  int x;
  int y;
  boolean walkable;
  boolean visible = false;
  String name;
  
  Tile(int _x, int _y, Tiles _type){
   x = _x;
   y = _y;
   type = _type;
   switch (type){
     case EMPTY:
     walkable = true;
     name = "Empty";
     break;
     case LAVA:
     walkable = false;
     name = "Lava";
     break;
   }
  }
  
  //funkcja do rysowania
  void disp(){
    if(visible){
      image(tile, x*32, y*32);
    }else{
     fill(0);
     rect(x*32,y*32,32,32);
    }
  }
};
