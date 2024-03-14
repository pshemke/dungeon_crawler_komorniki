class Moth extends Mob{
  Moth(int x,int y){
    this.x = x;
    this.y = y;
    this.hp = 5;
    this.attack = 1;
    this.name = "Moth";
    this.icon = moth_sheet.get(0,0,32,32);
  }

  Mob make_copy(int new_x, int new_y){return new Moth(new_x,new_y); };
  
  void move(Tile[][] map, Player player){
    if(player.x > this.x && map[this.x+1][this.y].walkable){
      if(player.x - this.x == 1){
       player.hp -= this.attack; 
      }else{
        this.x++;
      }
    }else if(player.x < this.x && map[this.x-1][this.y].walkable){
      if(player.x - this.x == -1){
       player.hp -= this.attack; 
      }else{
        this.x--;
      }
    }else if(player.y > this.y && map[this.x][this.y+1].walkable){
      if(player.y - this.y == 1){
       player.hp -= this.attack; 
      }else{
        this.y++;
      }
    }else if(player.y < this.y && map[this.x][this.y-1].walkable){
      if(player.y - this.y == -1){
       player.y -= this.attack; 
      }else{
        this.y--;
      }
  };
};
