import java.io.*;
import java.util.*;

PImage empty_txt;
PImage lava_txt;
PImage mossed_full_txt;
PImage mossed_txt;
PImage wall_txt;
PImage wall_gold_txt;
PImage floor_gold_txt;

PImage item_sheet;
PImage player_sheet;
PImage select_sheet;
PImage[] select = new PImage[4];
PImage[] player_idle = new PImage[2];
PImage[] player_walking = new PImage[4];

PImage player;

int X_TILES_NUMBER = 33;
int Y_TILES_NUMBER = 18;

Vector<Item> backpack = new Vector<Item>();
Vector<Item> ground_items = new Vector<Item>();

ItemPool pool = new ItemPool();

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
  player_sheet = loadImage("src/textures/AnimationSheet_Character.png");
  select_sheet = loadImage("src/textures/Spritesheets/Spritesheet_UI_Flat_Select_02.png");
  item_sheet = loadImage("src/textures/transparent_icon.png");
  
  load_sheet();
  
  pool.add_item(new WoodenSword(0,0), 4);
  pool.add_item(new GoldPouch(0,0), 5);
  pool.add_item(new Banana(0,0), 20);
  pool.add_item(new Pickaxe(0,0), 10);
  
  player = player_idle[0];

  generator();
  
  character.discover(TILE_MAP);
}

void draw(){
  background(128);
    for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j].disp();
        TILE_MAP[i][j].desc();
    }
  }
  
  character.animate();
  character.disp();
  character.show_stats();
  for(Item item : ground_items){
    if(TILE_MAP[item.x][item.y].visible){
   item.disp_map(); 
    }
  }
}

void keyPressed(){
 character.move(key); 
 for(Item item : ground_items){
    if(character.x == item.x && character.y == item.y){
   item.use(character); 
   backpack.add(item);
   ground_items.remove(item);
   break;
    }
  }
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
          
          float item_roll = random(100);
          if(item_roll < 5.0){
           ground_items.add(pool.loot()); 
          }
          
         }
       }
    }
  }
  //Step 3 - generate lava lakes
  int lava_number = 10;
  int max_lava_width = 2;
  int max_lava_height = 2;
  
  for(int i = 0; i < lava_number; i++){
    int lava_x = (int)random(X_TILES_NUMBER);
    int lava_y = (int)random(Y_TILES_NUMBER);
    int lava_width = (int)random(max_lava_width);
    int lava_height = (int)random(max_lava_height);
    for(int x = lava_x - lava_width; x < lava_width + lava_x + 1; x++){
       for(int y = lava_y - lava_width; y < lava_height + lava_y + 1; y++){
         if(is_on_map(x,y) && TILE_MAP[x][y].type == Tiles.EMPTY){
          TILE_MAP[x][y] = new Tile(x,y,Tiles.LAVA); 
         }
       }
    }
  }
  
  //Step 4 - generate wall_gold
  int wall_gold_number = 15;
  int max_wall_gold_width = 2;
  int max_wall_gold_height = 2;
  
  for(int i = 0; i < wall_gold_number; i++){
    int wall_gold_x = (int)random(X_TILES_NUMBER);
    int wall_gold_y = (int)random(Y_TILES_NUMBER);
    int wall_gold_width = (int)random(max_wall_gold_width);
    int wall_gold_height = (int)random(max_wall_gold_height);
    for(int x = wall_gold_x - wall_gold_width; x < wall_gold_width + wall_gold_x + 1; x++){
       for(int y = wall_gold_y - wall_gold_width; y < wall_gold_height + wall_gold_y + 1; y++){
         if(is_on_map(x,y) && TILE_MAP[x][y].type == Tiles.WALL){
          TILE_MAP[x][y] = new Tile(x,y,Tiles.WALL_GOLD); 
         }else if(is_on_map(x,y) && TILE_MAP[x][y].type == Tiles.EMPTY){
           TILE_MAP[x][y] = new Tile(x,y,Tiles.FLOOR_GOLD); 
         }
       }
    }
  }
  
  //Step 4 - generate moss
  int moss_number = 15;
  int max_moss_width = 2;
  int max_moss_height = 2;
  
  for(int i = 0; i < moss_number; i++){
    int moss_x = (int)random(X_TILES_NUMBER);
    int moss_y = (int)random(Y_TILES_NUMBER);
    int moss_width = (int)random(max_moss_width);
    int moss_height = (int)random(max_moss_height);
    for(int x = moss_x - moss_width; x < moss_width + moss_x + 1; x++){
       for(int y = moss_y - moss_width; y < moss_height + moss_y + 1; y++){
         if(is_on_map(x,y) && TILE_MAP[x][y].type == Tiles.EMPTY){
          TILE_MAP[x][y] = new Tile(x,y,Tiles.MOSSED_FULL); 
         }
       }
    }
  }
  
  //Step - player on empty tile
  TILE_MAP[character.x][character.y] = new Tile(character.x,character.y,Tiles.EMPTY);
}

void load_sheet(){
  for(int i =0; i<2; i++){
    player_idle[i] = player_sheet.get(0,32*i,32,32);
  }
  
  for(int i =0; i<4; i++){
    player_walking[i] = player_sheet.get(64,32*i,32,32);
  }
  
  for(int i=0;i<4;i++){
    select[i] = select_sheet.get(32*i,0,32,32);
  }
}
