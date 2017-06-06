class Tower {
  boolean place;
  int xcor;
  int ycor;
  int costToBuy;
  int costToSell;//actually not a cost, but amount of money you get, but that is v long to type
  Money theDough;
  Tower(int toBuy, int toSell, Money m) {
    costToBuy = toBuy;
    costToSell = toSell;
    theDough = m;
    place = false;
  }
  void createTower() {
    //if (theDough.showMoney() > costToBuy) {
      if (mousePressed) {
        place = true;
        xcor = mouseX;
        ycor = mouseY;
      }
      if (place) {
        rect(xcor, ycor, 50, 50, 30);
      } else {
        rect(mouseX, mouseY, 50, 50, 30);
      }
    //}
    //else have sidebar show "not enough money!"
  }
  void display() {
    createTower();
  }
  void remove() {
    theDough.addMoney(costToSell);
    //this = null;
  }
}