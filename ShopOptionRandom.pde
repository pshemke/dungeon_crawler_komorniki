class ShopOptionRandom extends ShopOption{
  ShopOptionRandom(int pos, int level){
    this.y = pos * 200;
    price = (int)random(10) * 5;
    stock = (int)random(50);
  }
  public void buy(Player character){
    int randomShop = (int)random(10);
    if(randomShop == 1){
      character.hp += 5;
      println("a small heal was rewarded");
    }else if(randomShop ==2){
      character.hp -= 2;
      println("ouch! a small amout of damage was received.");
    }else if(randomShop ==3){
      println("it's nothing but a scam!");
    }else if(randomShop ==4){
      character.hp += 50;
      println("a large amount of health was received... or was it?");
      delay(10000);
      character.hp -= 30;
    }else if(randomShop ==5){    
      //monsters.add(mob);
      println("UNDERTALE OST: Enemy Approaching");
    }else if(randomShop ==6){
      character.hp += 5;
      println("placeholder");
    }else if(randomShop ==7){
      character.hp += 5;
      println("placeholder");
    }else if(randomShop ==8){
      character.hp += 5;
      println("placeholder");
    }else if(randomShop ==9){
      character.hp += 5;
      println("placeholder");
    }else if(randomShop ==10){
      character.hp += 5;
      println("placeholder");
    }
  };
  public void display(){};
  
  
}
