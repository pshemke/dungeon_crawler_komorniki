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
     case MOSSED:
     regen = 5;
     name = "Mossed";
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
      switch(type){
        case EMPTY:
     image(empty_txt, x*32, y*32);
     break;
     case LAVA:
     image(lava_txt, x*32, y*32);
     break;
     case WALL:
     image(wall_txt, x*32, y*32);
     break;
     case MOSSED_FULL:
     image(mossed_full_txt, x*32, y*32);
     break;
     case MOSSED:
     image(mossed_txt, x*32, y*32);
     break;
     case WALL_GOLD:
     image(wall_gold_txt, x*32, y*32);
     break;
     case FLOOR_GOLD:
     image(floor_gold_txt, x*32, y*32);
     break;
      }
    }else{
     fill(0);
     rect(x*32,y*32,32,32);
    }
  }
  
  void desc(){
    fill(0);
    textSize(40);
    if(mouseX < (x+1)*32 && mouseX > x*32 && mouseY < (y+1)*32 && mouseY > y*32 && visible){
      String desc_name = "Name: " + name;
      text(desc_name, 0, 620);
      
      
    }
  }
};
