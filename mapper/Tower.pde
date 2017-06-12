class Tower{
  int x, y;
  int costToBuy, costToSell;
  int range, damage;
  int cost1, cost2, cost3, cost4;
  int nextUpgrade = 1;
  Projectile myProjectile;
  Tower(){
    costToBuy = 15;
    costToSell = 10;
    damage = 5;
    range = 70;
    cost1 = 10;
    cost2 = 15;
    cost3 = 17;
    cost4 = 20;
    myProjectile = new Projectile(mouseX*squareSize+squareSize/3+3,mouseY*squareSize+squareSize/4);
  }
  Tower(int xcor, int ycor){
    costToBuy = 15;
    costToSell = 10;
    damage = 5;
    range = 70;
    x = xcor;
    y = ycor;
    myProjectile = new Projectile(x*squareSize+squareSize/3+3,y*squareSize+squareSize/4);
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getRange(){
    return range;
  }
  int getDamage(){
    return damage;
  }
  int getSell(){
    return costToSell;
  }
  int getBuy(){
    return costToBuy;
  }
  void setCoords(int xcor, int ycor){  
    x = xcor;
    y = ycor;
  }
  void display(){
    rect(x, y, 30, 30, 10);
  }
  int getNextUpgrade(){
    if (nextUpgrade == 1){
      return cost1;
    }
    else if (nextUpgrade == 2){
      return cost2;
    }
    else if (nextUpgrade == 3){
      return cost3;
    }
    else if (nextUpgrade == 4){
      return cost4;
    }
    return 0;
  }
  void buyNextUpgrade(){
    if (nextUpgrade == 1){
      damage += 5;
      range += 10;
      costToSell = 17;
      nextUpgrade++;
    }
    else if (nextUpgrade == 2){
      damage += 5;
      range += 15;
      costToSell = 23;
      nextUpgrade++;
    }
    else if (nextUpgrade == 3){
      damage += 5;
      range += 15;
      costToSell = 27;
      nextUpgrade++;
    }
    else if (nextUpgrade == 4){
      damage += 5;
      range += 20;
      costToSell = 40;
      nextUpgrade = 0;
    }
    else{
      return;
    }
  }


  //display method to always be called in forever loop, set square below to green, enemies can't go there.
}