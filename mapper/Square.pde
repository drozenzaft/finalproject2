class Square {
  int x, y;
  Square(int xcor, int ycor) {
    x = xcor;
    y = ycor;
  }
  boolean inBounds() {
    return !(x < 0 || y < 0 || x >= width/50 || y >= height/50);
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
    return "(" + x + "," + y + "): " + num();
  }
}