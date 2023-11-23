public class Tile{
  Tiles type;
  int x;
  int y;
  boolean walkable = true;
  boolean visible = false;
  String name;
  int damage = 0;
  int regen = 0;
  int hp = 0;
  boolean breakable = false;
  
  Tile(int _x, int _y, Tiles _type){
   x = _x;
   y = _y;
   type = _type;
   switch (type){
     case EMPTY:
     name = "Empty";
     break;
     case LAVA:
     damage = 5;
     name = "Lava";
     break;
     case WALL:
     walkable = false;
     breakable = true;
     hp = 5;
     name = "Wall";
     break;
     case MOSSED_FULL:
     regen = 25;
     name = "MossedOut";
     break;
          case WALL_GOLD:
     walkable = false;
     breakable = true;
     hp = 7;
     name = "Wall_gold";
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
