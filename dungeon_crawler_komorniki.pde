PImage tile;
PImage player;

int X_TILES_NUMBER = 33;
int Y_TILES_NUMBER = 18;

Tile[][] TILE_MAP = new Tile[X_TILES_NUMBER][Y_TILES_NUMBER];

Player character = new Player();

void setup(){
  size(1280,720);
  tile = loadImage("src/textures/floor_tile.png");
  player = loadImage("src/textures/goober.png");
    for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j] = new Tile(i,j,true,"empty");
    }
  }
}

void draw(){
    for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j].disp();
    }
  }
}
