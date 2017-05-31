class Square {
  int distToGoal;
  int x, y;
  Square(int xcor, int ycor) {
    x = xcor;
    y = ycor;
    distToGoal = num();
  }
  int x() {
    return x;
  }
  int y() {
    return y;
  }
  int num() {
    return Math.abs(goal.x()-x) + Math.abs(goal.y()-y);
  }
}