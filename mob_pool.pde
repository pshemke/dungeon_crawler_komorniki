class MobPool{
  Vector<Mob> mobs = new Vector<Mob>();
  Vector<Integer> weights = new Vector<Integer>();
  int max_weight = 0;
  
  MobPool(){}
  Mob spawn(int x, int y){
    float roll = random(max_weight);
    for (int i = 0; i < weights.size(); i++){
      if(roll <= weights.get(i)){
        return mobs.get(i).make_copy(x, y);
      }
    }
    return mobs.get(0).make_copy(x,y);
  }
  
  void add_mob(Mob mob,int weight){
    mobs.add(mob);
    weights.add(max_weight + weight);
    max_weight += weight;
  }
  
}
