class Frog extends Mob{
  Frog(int x,int y){
    this.x = x;
    this.y = y;
    this.hp = 7;
    this.attack = 1;
    this.name = "Frog";
    this.icon = frogsheet.get(0,0,32,32);
  }

  Mob make_copy(int new_x, int new_y){return new Frog(new_x,new_y); };
  
  void move(Tile[][] map, Player player, Vector<Mob> mobs){
    if(random(10) > 9) {
      this.hp++;
    }
    if(player.x > this.x && map[this.x+1][this.y].walkable && !is_mob(x+1,y,mobs)){
      if(player.x - this.x == 1 && player.y == this.y ){
       player.hp -= this.attack; 
      }else{
        this.x++;
      }
    }else if(player.x < this.x && map[this.x-1][this.y].walkable && !is_mob(x-1,y,mobs)){
      if(player.x - this.x == -1 && player.y == this.y){
       player.hp -= this.attack; 
      }else{
        this.x--;
      }
    }else if(player.y > this.y && map[this.x][this.y+1].walkable && !is_mob(x,y+1,mobs)){
      if(player.y - this.y == 1 && player.x == this.x){
       player.hp -= this.attack; 
      }else{
        this.y++;
      }
    }else if(player.y < this.y && map[this.x][this.y-1].walkable && !is_mob(x,y-1,mobs)){
      if(player.y - this.y == -1 && player.x == this.x){
       player.hp -= this.attack; 
      }else{
        this.y--;
      }
    }
  };
};
