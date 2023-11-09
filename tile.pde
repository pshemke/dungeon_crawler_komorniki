public class Tile{
  int x;
  int y;
  boolean walkable;
  boolean visible = false;
  String name;
  
  Tile(int _x, int _y, boolean _walkable, String _name){
   x = _x;
   y = _y;
   walkable = _walkable;
   name = _name;
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
