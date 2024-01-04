PImage empty_txt;
PImage lava_txt;
PImage mossed_full_txt;
PImage mossed_txt;
PImage wall_txt;
PImage wall_gold_txt;
PImage floor_gold_txt;

PImage player;

int X_TILES_NUMBER = 33;
int Y_TILES_NUMBER = 18;

enum Tiles{
 EMPTY,
 LAVA,
 MOSSED,
 MOSSED_FULL,
 WALL,
 WALL_GOLD,
 FLOOR_GOLD,
 MAX
}

Tile[][] TILE_MAP = new Tile[X_TILES_NUMBER][Y_TILES_NUMBER];

Player character = new Player(2,2);

void setup(){
  size(1280,720);
  empty_txt = loadImage("src/textures/floor_tile.png");
  lava_txt = loadImage("src/textures/lava_tile-32x32.png");
  mossed_full_txt = loadImage("src/textures/fully_meched.png");
  mossed_txt = loadImage("src/textures/mossy_floor.png");
  wall_txt = loadImage("src/textures/ston-wol-32x32.png");
  wall_gold_txt = loadImage("src/textures/wall_gold.png");
  floor_gold_txt = loadImage("src/textures/floor_tile_gold.png");
  
  player = loadImage("src/textures/goober.png");

  generator();
  
  character.discover(TILE_MAP);
}

void draw(){
    for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j].disp();
    }
  }
  
  character.disp();
}

void keyPressed(){
 character.move(key); 
}

boolean is_on_map(int x, int y){
  return (x > -1 && x < X_TILES_NUMBER && y > -1 && y < Y_TILES_NUMBER);
}

void generator(){
  // Step 1 - fill wall
  for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j] = new Tile(i,j,Tiles.WALL);
    }
  }
  // Step 2 - create empty cave
  int cave_number = 20;
  int max_cave_width = 3;
  int max_cave_height = 2;
  
  for(int i = 0; i < cave_number; i++){
    int cave_x = (int)random(X_TILES_NUMBER);
    int cave_y = (int)random(Y_TILES_NUMBER);
    int cave_width = (int)random(max_cave_width);
    int cave_height = (int)random(max_cave_height);
    for(int x = cave_x - cave_width; x < cave_width + cave_x + 1; x++){
       for(int y = cave_y - cave_width; y < cave_height + cave_y + 1; y++){
         if(is_on_map(x,y)){
          TILE_MAP[x][y] = new Tile(x,y,Tiles.EMPTY); 
         }
       }
    }
  }
  
  //Step - player on empty tile
  TILE_MAP[character.x][character.y] = new Tile(character.x,character.y,Tiles.EMPTY);
}
