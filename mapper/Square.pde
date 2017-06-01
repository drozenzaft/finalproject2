class Square {
  int distToGoal;
  int directX, directY;
  int x, y;
  float speed;
  color c;
  Square(int xcor, int ycor) {
    x = xcor;
    y = ycor;
    speed = 0.25;
    distToGoal = num();
    fill(17, 6, 188);
  }
  Square(int xcor, int ycor, color c) {
    x = xcor;
    y = ycor;
    distToGoal = num();
    fill(c);
  }    
  boolean inBounds() {
    return !(x < 0 || y < 0 || x > width/50 || y > height/50);
  }
  int compareTo(Square other) {
    if (distToGoal < other.num()) return 1;
    if (distToGoal > other.num()) return -1;
    return 0;
  }
  Square copy() {
    return new Square(x, y);
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
  float[] nextMove() {
    float[][] moves = new float[][]{{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    int ind = -1;
    int low = 1000000;
    Square a;
    for (int i = 0; i < moves.length; i++) {
      a = new Square(x+(int)(moves[i][0]), y+(int)(moves[i][1]));
      if (a.inBounds() && (ind == -1 || a.num() < low)) {
        ind = i;
        low = a.num();
      }
    }
    return moves[ind];
  }
  String toString() {
    return "(" + x + "," + y + "): " + distToGoal;
  }
}