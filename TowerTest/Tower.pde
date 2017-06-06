class Tower {
  int q;
  int xcor;
  int ycor;
  boolean place;
  Money theDough;
  int costToBuy;
  int costToSell;
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
      rect(xcor, ycor, q, q, 30);
    } else {
      rect(mouseX, mouseY, q, q, 30);
    }
    //}
  }
  //else have sidebar show "not enough money!"

  //showdata: if (clicked)--> highlight area around showing range, (for now at least)
  void display() {
    createTower();
  }
  void remove() {
    theDough.addMoney(costToSell);
    //this = null;
  }
}