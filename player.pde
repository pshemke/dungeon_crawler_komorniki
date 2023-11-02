public class Player{
  int x;
  int y;
  
  Player(int _x, int _y){
   x = _x;
   y = _y;
  }
  
  //funkcja do rysowania
  void disp(){
    image(player, x*32, y*32);
  }
  
}
