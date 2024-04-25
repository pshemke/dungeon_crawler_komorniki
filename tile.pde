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
  String descr = "descr";
  Item item = null;

  Tile(int _x, int _y, Tiles _type){
   x = _x;
   y = _y;
   type = _type;
   switch (type){
     case EMPTY:
     name = "Empty";
       this.descr = "Nothing here";
     break;
     case LAVA:
     damage = 5;
     name = "Lava";
     this.descr = "This is lava";
     break;
     case WALL:
     this.descr = "This is a wall";
     walkable = false;
     breakable = true;
     hp = 5;
     name = "Wall";
     break;
     case MOSSED_FULL:
     regen = 25;
     name = "Mossed";
      this.descr = "This is moss";
     break;
     case MOSSED:
     regen = 5;
     name = "Moss";
      this.descr = "This is moss";
     break;
     case WALL_GOLD:
     walkable = false;
     breakable = true;
     hp = 7;
     gold = 3 + (int)random(5);
     name = "Wall Gold";
      this.descr = "wall with gold";
     break;
     case FLOOR_GOLD:
     gold = 1 + (int)random(2);
     name = "Floor Gold";
      this.descr = "Floor with gold";
     break;
     case LADDER:
       name = "Ladder";
       this.descr = "Go to next floor";
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
     case LADDER:
     image(ladder_txt, x*32, y*32);
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
      fill(227, 11, 188);
      String desc_name = "Name: " + name;
      text(desc_name, 0, 620);
        fill(225);
             String tile_health = "health: " + hp;
             String description = "info: " + descr;
             textSize(30);
             textSize(25);
             
               image(item_sheet.get(32*0,32*13,32,32),0,654);
              text(description, 30, 680);
                fill(255);
          textSize(25);
             image(item_sheet.get(32*0,32*1,32,32),0,624);
          text(tile_health,30,650);
                
      
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
          fill(255);
             String mob_name = "Mob: " + mob.name;
             String mob_health = "health: " + mob.hp;
             String desc = "info: " + mob.desc;
             textSize(30);
             image(item_sheet.get(32*0,32*0,32,32),280,624);
             text(mob_name, 300, 650);
              
             textSize(25);
               image(item_sheet.get(32*0,32*13,32,32),280,684);
               text(desc, 300, 710);
                fill(255);
          textSize(25);
             image(item_sheet.get(32*0,32*1,32,32),280,654);
          text(mob_health,300,680);
          fill(227, 11, 188);
          textSize(40);
           text("Mob", 325, 620);
                
              }
      }
      }
      
    }
  }
};
