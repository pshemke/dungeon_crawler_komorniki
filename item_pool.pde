class ItemPool{
  Vector<Item> items = new Vector<Item>();
  Vector<Integer> weights = new Vector<Integer>();
  int max_weight = 0;
  
  ItemPool(){}
  Item loot(int x, int y){
    float roll = random(max_weight);
    for (int i = 0; i < weights.size(); i++){
      if(roll <= weights.get(i)){
        return items.get(i).make_copy(x, y);
      }
    }
    return items.get(0).make_copy(x,y);
  }
  
  void add_item(Item item,int weight){
    items.add(item);
    weights.add(max_weight + weight);
    max_weight += weight;
  }
  
}
