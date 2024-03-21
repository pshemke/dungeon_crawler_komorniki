class Mob{
  int hp = 1;
  int attack = 1;
  String name = "name";
  
  PImage icon;
  
  int x;
  int y;
  
  
  public void disp_map(){image(icon, x*32, y*32);};
  public Mob make_copy(int new_x, int new_y){return null; };
  public void move(Tile[][] map, Player player, Vector<Mob> mobs){};
  public Boolean is_mob
};
