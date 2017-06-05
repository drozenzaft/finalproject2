class Square {
  int x, y, distToGoal;
  boolean canTraverse;
  Square(int xcor, int ycor) {
    x = xcor;
    y = ycor;
    canTraverse = true;
  }
  Square(int xcor, int ycor, boolean boo) {
    x = xcor;
    y = ycor;
    canTraverse = boo;
  }
  Square(int xcor, int ycor, boolean boo, int distToGoal) {
    x = xcor;
    y = ycor;
    canTraverse = boo;
    this.distToGoal = distToGoal;
  }
  boolean inBounds() {
    return !(x < 0 || y < 0 || x >= width/50 || y >= height/50) && !(get(x*50, y*50) == color(0, 255, 0)) && canTraverse;
  }
  /*int num() {
   //make a breadth-first search instead of manhattan distance
   return Math.abs(goalX-x) + Math.abs(goalY-y);
   }*/
  boolean canTraverse() {
    return get(x, y) == color(0, 255, 0);
  }
  /*int num() {
    float[][] moves = new float[][]{{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    int ans = 0;
    FrontierPriorityQueue frontier = new FrontierPriorityQueue(false);
    Square current = new Square(goalX, goalY, true);
    frontier.add(current);
    while (frontier.size() > 0) {
      current = frontier.next();
      if (current.x == x && current.y == y) return ans;
      for (float[] move : moves) {
        try {
          Square a = new Square(current.x+(int)(move[0]), current.y+(int)(move[1]));
          if (a.inBounds()) {
            frontier.add(a);
          }
        }
        catch (IndexOutOfBoundsException e) {
        }
      }
      ans++;
    }
    return -1;
  }*/

  int compareTo(Square other) {
    if (num() < other.num()) return 1;
    if (num() > other.num()) return -1;
    return 0;
  }
  float[] nextMove() {
    float[][] moves = new float[][]{{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    int ind = -1;
    int low = 1000000;
    Square a;
    for (int i = 0; i < moves.length; i++) {
      try {
        a = map.get(x+(int)(moves[i][0]), y+(int)(moves[i][1]));
        if (a.inBounds() && (ind == -1 || a.num() < low)) {
          ind = i;
          low = a.num();
        }
      }
      catch (IndexOutOfBoundsException e) {
      };
    }
    return moves[ind];
  }
  void mouse() {
    if ((int)(mouseX/50) == x && (int)(mouseY/50) == y) canTraverse = false;
  }
  String toString() {
    return "(" + x + "," + y + "): " + num();
  }
}