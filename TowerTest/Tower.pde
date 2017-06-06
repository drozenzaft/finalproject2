class Tower {
<<<<<<< HEAD
  int q;
  int xcor;
  int ycor;
  boolean place;
  Tower(int c) {
    q = c;
    place = false;
  }
  void createTower() {
    if (mousePressed) {
      place = true;
      xcor = mouseX;
      ycor = mouseY;
    }
    if (place){
      rect(xcor, ycor, q, q, 30);
    } 
    else {
      rect(mouseX, mouseY, q, q, 30);
=======
  int costToBuy;
  int costToSell;//actually not a cost, but amount of money you get, but that is v long to type
  Money theDough;
  Tower(int toBuy, int toSell, Money m) {
    costToBuy = toBuy;
    costToSell = toSell;
    theDough = m;
  }
  void createTower() {
    if (theDough.showMoney() > costToBuy) {
      rect(mouseX, mouseY, 50, 50, 30);
      if (mousePressed) {
        rect(mouseX, mouseY, 50, 50, 30);
      }
>>>>>>> 97ef7e99c5c35590df7f3a8db95e9d7ed256da35
    }
    //else have sidebar show "not enough money!"
  }
  //showdata: if (clicked)--> highlight area around showing range, (for now at least)
  void display() {
    createTower();
  }
  void remove() {
    theDough.addMoney(costToSell);
    //this = null;
  }
}