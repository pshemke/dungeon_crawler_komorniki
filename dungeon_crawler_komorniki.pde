PImage tile;

void setup(){
  size(1280,720);
  tile = loadImage("src/textures/floor_tile.png");
}

void draw(){
  image(tile,0,0);
  for(int i = 0; i < width/32;i++){
    for(int j = 0; j < height/32; j++){
      image(tile, i*32, j*32);
    }
  }
}
