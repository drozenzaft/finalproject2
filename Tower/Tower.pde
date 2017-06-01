abstract class Tower {
  Upgrade[]remaining;
  //need an upgrade class?
  //is boughtUpgrades needed??
  int damage;
  int speed;
  int price;
  int costToSell;
  projectile Projectile;
  //need a projectile class
  int range;
  int timeBetSuccessive;
  /**void MousePressed() {
    buy();
    moveTower();
  }*/
  void moveTower() {
    /**int x = 
     float targetX = mouseX;
     float dx = targetX - x;*/
    ellipse(mouseX, mouseY, 54, 54);//doesnt need to be ellipse, will eventually be the tower, but just for testing now
    if (mousePressed) {
      placeTower(x, y);
    }
  }
  void placeTower(int x, int y) { 
    ellipse(x, y, 54, 54);
  }
  void buy() {
    if (Money.showMoney() >= price) {
      Money.buy(price);
    }
    //void sell() {
      //remove from map, delete????
    }
    //void upgrade {
    /**eventlistener for mouse to understand where clicked; then if (enoughMoney){
     remove from remaining and update whatever is necessary.*/
    }