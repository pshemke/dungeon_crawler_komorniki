public class Tile{
  int frame_count=0;
  int frame_wait=0;
  
  Tiles type;
  int x;
  int y;
  boolean walkable = true;
  boolean visible = false;
  String name;
  int damage = 0;
  int regen = 0;
  int hp = 0;
  int gold = 0;
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
     name = "Mossed Out";
     break;
     case MOSSED:
     regen = 5;
     name = "Mossed";
     break;
     case WALL_GOLD:
     walkable = false;
     breakable = true;
     hp = 7;
     gold = 3 + (int)random(5);
     name = "Wall Gold";
     break;
     case FLOOR_GOLD:
     gold = 1 + (int)random(2);
     name = "Floor Gold";
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
    if(mouseX <= (x+1)*32 && mouseX > x*32 && mouseY <= (y+1)*32 && mouseY > y*32 && visible){
      String desc_name = "Name: " + name;
      text(desc_name, 0, 620);
      
      image(select[frame_count],mouseX - mouseX %32,mouseY - mouseY %32);
      frame_wait++;
      if(frame_wait > 10){
      frame_count++;
      frame_wait=0;
      }
      if(frame_count > 3){
        frame_count = 0;     
      }
      
    }
  }
};
