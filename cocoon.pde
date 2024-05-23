 class Cocoon extends Mob{
   int cooldown = 0;
   int spawnrate = 5;
   
  Cocoon(int x,int y){
    this.x = x;
    this.y = y;
    this.hp = 5;
    this.attack = 1;
    this.name = "cocoon";
    this.desc = "This is tse tse spawner";
    this.icon = cocoon.get(0,0,32,32);
  }

  Mob make_copy(int new_x, int new_y){return new Cocoon(new_x,new_y); };
  
  
  void move(Tile[][] map, Player player, Vector<Mob> mobs){
    if(cooldown == spawnrate){
    if(map[this.x+1][this.y].walkable && !is_mob(x+1,y,mobs)){
      if(player.x - this.x != 1 && player.y != this.y ){
       new_monsters.add(new Tsetse(this.x + 1, this.y));
      
      }
    }else if(map[this.x-1][this.y].walkable && !is_mob(x-1,y,mobs)){
      if(player.x - this.x != -1 && player.y != this.y){
       new_monsters.add(new Tsetse(this.x - 1, this.y));
      
      }
    }else if(map[this.x][this.y+1].walkable && !is_mob(x,y+1,mobs)){
      if(player.y - this.y != 1 && player.x != this.x){
       new_monsters.add(new Tsetse(this.x, this.y + 1));
      
      }
    }else if(map[this.x][this.y-1].walkable && !is_mob(x,y-1,mobs)){
      if(player.y - this.y != -1 && player.x != this.x){
       new_monsters.add(new Tsetse(this.x, this.y - 1)); 
      
      }
    }
    cooldown = 0;
    }else{
    cooldown++;
    
    }
    
 }
 }
