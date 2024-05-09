enum States{
     IDLE,
     WALKING
    }

public class Player{
  int x;
  int y;
  
  int damage = 1;
  int mining = 1;
  int defence = 0;
  int hp = 10;
  int gold = 0;
  int stamina = 5;
  
  
  States state = States.IDLE;
  int animation_counter=0;
  
  Player(int _x, int _y){
   x = _x;
   y = _y;
  }
  
  //funkcja do rysowania
  void disp(){
    image(player, x*32, y*32);
  }
  void move(char input){
    switch (input){
      case 'a': if(is_on_map(x-1,y)){
        if(is_mob(x-1,y)){
          attack(x-1,y);
        }else{
      tile_behavior(x-1,y,TILE_MAP);}
      } 
      break;
      case 'd': if(is_on_map(x+1,y)){
       if(is_mob(x+1,y)){
          attack(x+1,y);
        }else{
      tile_behavior(x+1,y,TILE_MAP);}
    } 
      break;
      case 'w': if(is_on_map(x,y-1)){
       if(is_mob(x,y-1)){
          attack(x,y-1);
        }else{
      tile_behavior(x,y-1,TILE_MAP);}
    } break;
      case 's': if(is_on_map(x,y+1)){ if(is_mob(x,y+1)){
          attack(x,y+1);
        }else{
      tile_behavior(x,y+1,TILE_MAP);}
    }
    break;
    }
    this.discover(TILE_MAP);
  }
  
  void tile_behavior(int x, int y, Tile[][] map){
    if(map[x][y].walkable){
      this.x = x;
      this.y = y;
    }else if(map[x][y].breakable){
      map[x][y].hp -= mining;
      if(map[x][y].hp < 1){
        //if(map[x][y].gold > 0){
          //player.gold += map[x][y].gold;
      //  }
        map[x][y] = new Tile(x,y,Tiles.EMPTY);
      }
    }
    if(map[this.x][this.y].type == Tiles.LADDER){
      ground_items.clear();
      monsters.clear();
      generator();
    }
  }
  
  
  void discover(Tile[][] map){
    for( int i = -1; i < 2; i++){
        for( int ii = -1; ii < 2; ii++){
           if(is_on_map(x+i,y+ii)) {
             map[x+i][y+ii].visible = true;
           }
        }
    }
  }
  
  void animate(){
     switch(state){
      case IDLE:
      player = player_idle[animation_counter];
      animation_counter++;
      if(animation_counter>1){
       animation_counter=0; 
      }
      break;
     }
  }
  
  
  void show_stats(){
    fill(255);
    textSize(32);
    //damage
    image(item_sheet.get(32*4,32*1,32,32),33*32,0*32);
    text(this.damage,34*32 + 5,1*32 - 5);
    //mining
    image(item_sheet.get(32*5,32*4,32,32),33*32,1*32);
    text(this.mining,34*32 + 5,2*32 - 5);
    //defence
    image(item_sheet.get(32*1,32*7,32,32),33*32,2*32);
    text(this.defence,34*32 + 5,3*32 - 5);
    //hp
    image(item_sheet.get(32*0,32*1,32,32),33*32,3*32);
    text(this.hp,34*32 + 5,4*32 - 5);
    //gold
    image(item_sheet.get(32*3,32*17,32,32),33*32,4*32);
    text(this.gold,34*32 + 5,5*32 - 5);
    //stamina
    image(item_sheet.get(32*3,32*17,32,32),33*32,4*32);
    text(this.stamina,34*32 + 5,6*32 - 5);
  }
  
  Boolean is_mob(int x, int y){
    for(int i = 0; i < monsters.size(); i++){
     if (monsters.get(i).x == x && monsters.get(i).y == y){
       return true;
     }
    }
    return false;
  }
  
  void attack(int x, int y){
    for(int i = 0; i < monsters.size(); i++){
     if (monsters.get(i).x == x && monsters.get(i).y == y){
       monsters.get(i).hp -= this.damage;
       if( monsters.get(i).hp <= 0){
         monsters.remove(monsters.get(i));
         //image(magic_sheet2.get(64*0,64*1,64,64),monsters.get(i).x-8,monsters.get(i).y+8);
       break;
       }
     }
    }
  }
}
