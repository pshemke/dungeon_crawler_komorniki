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
  
  Item item = null;
  
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
  
  void desc(Vector<Mob> monsters){
    fill(0);
    textSize(40);
    if(mouseX <= (x+1)*32 && mouseX > x*32 && mouseY <= (y+1)*32 && mouseY > y*32 && visible){
      //tile information
      String desc_name = "Name: " + name;
      text(desc_name, 0, 620);
      
      //select animation
      image(select[frame_count],mouseX - mouseX %32,mouseY - mouseY %32);
      frame_wait++;
      if(frame_wait > 10){
      frame_count++;
      frame_wait=0;
      }
      if(frame_count > 3){
        frame_count = 0;     
      }
      
      //mob information
      if (display_mode == "mob"){
       for(Mob mob : monsters){
        if( mob.x == this.x && mob.y == this.y){
          print("jestem tu");
          fill(255);
          textAlign(CENTER);
          text(mob.name, (this.x*32)+16, ((this.y-1)*32)-24);
          image(item_sheet.get(32*0,32*1,32,32), (this.x*32)-16, ((this.y)*32)-49);
          image(item_sheet.get(32*4,32*1,32,32), (this.x*32)-16, ((this.y)*32)-25);
          
          textAlign(LEFT);
          if(mob.hp >= 4){
            fill(0,255,0);
          }else if(mob.hp <= 3){
            fill(255,255,0);
          }else if(mob.hp <= 2){
            fill(255,0,0);
          }
          textSize(25);
          text(mob.hp, (this.x*32)+30, ((this.y-1)*32)+8);
          fill(255,0,0);
          text(mob.attack, (this.x*32)+30, ((this.y-1)*32)+33);
        }
      } 
      }else if(display_mode == "left_corner"){
              for(Mob mob : monsters){
        if( mob.x == this.x && mob.y == this.y){
             String mob_name = "Mob: " + mob.name;
             String mob_health = "health: " + mob.hp;
             String desc = "info: " + mob.desc;
             textSize(30);
             image(item_sheet.get(32*0,32*0,32,32),270,624);
             text(mob_name, 300, 650);
             textSize(25);
               image(item_sheet.get(32*0,32*13,32,32),270,684);
               text(desc, 300, 710);
                fill(255);
          textSize(25);
             image(item_sheet.get(32*0,32*1,32,32),270,654);
          text(mob_health,300,680);
                
              }
      }
      }
      
    }
  }
};
