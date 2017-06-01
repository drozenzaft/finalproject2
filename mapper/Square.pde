class Square {
  int distToGoal;
  int x, y;
  color c;
  Square(int xcor, int ycor) {
    x = xcor;
    y = ycor;
    distToGoal = num();
    fill(17, 6, 188);
  }
  Square(int xcor, int ycor, color c) {
    x = xcor;
    y = ycor;
    distToGoal = num();
    fill(c);
  }
  int compareTo(Square other) {
    if (distToGoal < other.num()) return 1;
    if (distToGoal > other.num()) return -1;
    return 0;
  }
  Square copy() {
    return new Square(x,y);
  }
  int x() {
    return x;
  }
  void incXY(int i, int j) {
    x += i;
    y += j;
  }
  void setDist() {
    distToGoal = num();
  }
  int y() {
    return y;
  }
  int num() {
    return Math.abs(goalX-x) + Math.abs(goalY-y);
  }
  String toString() {
    return "(" + x + "," + y + "): " + distToGoal;
  }
}