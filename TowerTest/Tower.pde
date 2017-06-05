class Tower {
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
    }
  }
  //showdata: if (clicked)--> highlight area around showing range, (for now at least)
  void display() {
    createTower();
  }
}