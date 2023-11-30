public class Player{
  int x;
  int y;
  
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
      case 'a': if(is_on_map(x-1,y)){tile_behavior(x-1,y,TILE_MAP);} break;
      case 'd': if(is_on_map(x+1,y)){tile_behavior(x+1,y,TILE_MAP);} break;
      case 'w': if(is_on_map(x,y-1)){tile_behavior(x,y-1,TILE_MAP);} break;
      case 's': if(is_on_map(x,y+1)){tile_behavior(x,y+1,TILE_MAP);} break;
    }
    this.discover(TILE_MAP);
  }
  
  void tile_behavior(int x, int y, Tile[][] map){
    if(map[x][y].walkable){
      this.x = x;
      this.y = y;
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
  
}
