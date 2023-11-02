public class Tile{
  int x;
  int y;
  boolean walkable;
  String name;
  
  Tile(int _x, int _y, boolean _walkable, String _name){
   x = _x;
   y = _y;
   walkable = _walkable;
   name = _name;
  }
  
  //funkcja do rysowania
  void disp(){
    image(tile, x*32, y*32);
  }
};
