import java.io.*;
import java.util.*;

PImage empty_txt;
PImage lava_txt;
PImage mossed_full_txt;
PImage mossed_txt;
PImage wall_txt;
PImage wall_gold_txt;
PImage floor_gold_txt;
PImage ladder_txt;

PImage slimegreen;
PImage slimeblue;
PImage item_sheet;
PImage player_sheet;
PImage select_sheet;
PImage moth_sheet;
PImage frogsheet;
PImage salamander_sheet;
PImage slime_sheet;
PImage tsetsesheet;
PImage ants;
PImage cocoon;
PImage magic_sheet;
PImage magic_sheet2;
PImage placeholder;
PImage[] select = new PImage[4];
PImage[] player_idle = new PImage[2];
PImage[] player_walking = new PImage[4];

PImage player;

//"mob", "left_corner", "right_corner"
String display_mode = "left_corner";

int X_TILES_NUMBER = 33;
int Y_TILES_NUMBER = 18;
int floor = 1;

Vector<Item> backpack = new Vector<Item>();
Vector<Item> ground_items = new Vector<Item>();
Vector<Mob> monsters = new Vector<Mob>();
Vector<Mob> new_monsters = new Vector<Mob>();

ItemPool pool = new ItemPool();
MobPool mob_pool = new MobPool();

enum Tiles{
 EMPTY,
 LAVA,
 MOSSED,
 MOSSED_FULL,
 WALL,
 WALL_GOLD,
 FLOOR_GOLD,
 LADDER,
 MAX
}

String game_state = "shop";

Vector<ShopOption> shopOptions = new Vector<ShopOption>();


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
  moth_sheet = loadImage("src/textures/mothanims.png");
  item_sheet = loadImage("src/textures/transparent_icon.png");
  ants = loadImage("src/textures/ants.png");
  cocoon = loadImage("src/textures/jungle/cocoon.png");
  frogsheet = loadImage("src/textures/frogsheet.png");
  salamander_sheet = loadImage("src/textures/Jungle/salamandersheet.png");
  tsetsesheet = loadImage("src/textures/Jungle/tsetsesheet.png");
  slime_sheet = loadImage("src/textures/slime_sheet.png");
  slimeblue = loadImage("src/textures/Slime/Slimeblue.png");
  slimegreen = loadImage("src/textures/Slime/Slimegreen.png");
  ladder_txt = loadImage("src/textures/ladder-32x32.png");
  magic_sheet = loadImage("src/textures/00.png");
  magic_sheet2 = loadImage("src/textures/01.png");
  placeholder = loadImage("src/textures/placeholder.png");
  
  load_sheet();
  
  pool.add_item(new WoodenSword(0,0), 4);
  pool.add_item(new GoldPouch(0,0), 5);
  pool.add_item(new Banana(0,0), 20);
  pool.add_item(new Pickaxe(0,0), 10);
  
  //mob_pool.add_mob(new Cocoon(0,0), 100);
  mob_pool.add_mob(new Moth(0,0), 10);
  mob_pool.add_mob(new Frog(0,0), 20);
  mob_pool.add_mob(new Slime(0,0), 20);
  mob_pool.add_mob(new Salamander(0,0), 20);
  mob_pool.add_mob(new Tsetse(0,0), 20);
      mob_pool.add_mob(new blue_slime(0,0), 15);
     mob_pool.add_mob(new green_slime(0,0), 10);
  mob_pool.add_mob(new Ants(0,0), 20);
  
  player = player_idle[0];

  generator();
  
  character.discover(TILE_MAP);
  
  shopOptions.add( new ShopOptionHealth(0,1));
  shopOptions.add( new ShopOptionMining(1,1));
  shopOptions.add( new ShopOptionArmor(2,1));
}

void draw(){

  background(12, 31, 89);
  fill(255);
  rect(285,575,5,445);
  character.show_stats();
  if(game_state == "game"){

    for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j].disp();
    }
  }
  
  character.animate();
  character.disp();

  for(Item item : ground_items){
    if(TILE_MAP[item.x][item.y].visible){
   item.disp_map(); 
    }
  }
  for(Mob mob : monsters){
    if(TILE_MAP[mob.x][mob.y].visible){
   mob.disp_map(); 
    }
  }
  for(int i = 0; i < X_TILES_NUMBER;i++){
      for(int j = 0; j < Y_TILES_NUMBER; j++){
        TILE_MAP[i][j].desc(monsters);
    }
  }
  }else if(game_state == "shop"){
    fill(150);
    rect(0,0,33*32, 18*32);
    for (ShopOption option : shopOptions){
     option.display() ;
    }
  }
}

void keyPressed(){
  if (game_state == "game"){
 character.move(key); 
 for(Item item : ground_items){
    if(character.x == item.x && character.y == item.y){
   item.use(character); 
   backpack.add(item);
   ground_items.remove(item);
   break;
    }
  }
  for(Mob mob : monsters){
   mob.move(TILE_MAP,character,monsters); 
  }
  for(Mob mob : new_monsters){
   monsters.add(mob);
  }
  new_monsters.clear();
  
  if(TILE_MAP[character.x][character.y].name == "Lava") {
    character.hp--;
    character.stamina += 3;
  }
  if(key == 'K' ^ key == 'k') {
    if(TILE_MAP[character.x][character.y].name == "Mossed Out") {
      character.hp += 5;
      TILE_MAP[character.x][character.y] = new Tile(character.x,character.y,Tiles.EMPTY);
    }
  }
  if(key == 'E' ^ key == 'e') {
    if(mouseX/32 > character.x && mouseY/32 > character.x) {
      if(TILE_MAP[character.x + 2][character.y].walkable == true){
        character.x += 2;
      }else if(TILE_MAP[character.x + 1][character.y].walkable == true){
        character.x += 1;
      }else {
      character.x += 0;
      }
    }else if(mouseX/32 < character.x && mouseY/32 > character.x) {
      if(TILE_MAP[character.x][character.y + 2].walkable == true){
        character.y += 2;
      }else if(TILE_MAP[character.x][character.y + 1].walkable == true){
        character.y += 1;
      }else {
      character.y += 0;
      }
    }else if(mouseX/32 > character.x && mouseY/32 < character.x) {
      if(TILE_MAP[character.x][character.y - 2].walkable == true){
        character.y -= 2;
      }else if(TILE_MAP[character.x][character.y - 1].walkable == true){
        character.y -= 1;
      }else {
      character.y -= 0;
      }
    }else if(mouseX/32 < character.x && mouseY/32 < character.x) {
      if(TILE_MAP[character.x - 2][character.y].walkable == true){
        character.x -= 2;
      }else if(TILE_MAP[character.x - 1][character.y].walkable == true){
        character.x -= 1;
      }else {
      character.x -= 0;
      }
    }
    character.stamina --;
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
           ground_items.add(pool.loot(x,y)); 
          }
          float mob_roll = random(100);
          if(mob_roll < 8.0){
           monsters.add(mob_pool.spawn(x,y)); 
          }
          
         }
       }
    }
  }
  while(true){
    int ladder_x = (int)random(X_TILES_NUMBER);
    int ladder_y = (int)random(Y_TILES_NUMBER);
    if(TILE_MAP[ladder_x][ladder_y].type == Tiles.EMPTY){
      TILE_MAP[ladder_x][ladder_y] = new Tile(ladder_x,ladder_y,Tiles.LADDER); 
      break;
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
