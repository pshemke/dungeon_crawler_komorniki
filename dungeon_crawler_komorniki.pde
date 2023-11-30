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

Player character = new Player(0,0);

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
    for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j] = new Tile(i,j,Tiles.EMPTY);
    }
  }
  TILE_MAP[5][5] = new Tile(5,5,Tiles.WALL);
  
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
