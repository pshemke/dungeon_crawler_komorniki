class Tsetse extends Mob{
  Tsetse(int x,int y){
    this.x = x;
    this.y = y;
    this.hp = 2;
    this.attack = 1;
    this.name = "Tsetse";
    this.desc = "This is a tsetse";
    this.icon = tsetsesheet.get(0,0,32,32);
  }

  Mob make_copy(int new_x, int new_y){return new Tsetse(new_x,new_y); };
  
  void move(Tile[][] map, Player player, Vector<Mob> mobs){
    if(player.x > this.x && !is_mob(x+1,y,mobs)){
      if(player.x - this.x == 1 && player.y == this.y ){
       player.hp -= this.attack; 
      }else{
        this.x++;
      }
    }else if(player.x < this.x && !is_mob(x-1,y,mobs)){
      if(player.x - this.x == -1 && player.y == this.y){
       player.hp -= this.attack; 
      }else{
        this.x--;
      }
    }else if(player.y > this.y && !is_mob(x,y+1,mobs)){
      if(player.y - this.y == 1 && player.x == this.x){
       player.hp -= this.attack; 
      }else{
        this.y++;
      }
    }else if(player.y < this.y && !is_mob(x,y-1,mobs)){
      if(player.y - this.y == -1 && player.x == this.x){
       player.hp -= this.attack; 
      }else{
        this.y--;
      }
    }
  };
};
