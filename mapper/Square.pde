class Square {
  int x, y, distToGoal;
  boolean canTraverse, initialized;
  Projectile myProjectile;
  Square(int xcor, int ycor) {
    x = xcor;
    y = ycor;
    canTraverse = true;
    initialized = false;
    myProjectile = new Projectile(x*squareSize+squareSize/3+3,y*squareSize+squareSize/4);
  }
  Square(int xcor, int ycor, boolean boo, int distToGoal) {
    x = xcor;
    y = ycor;
    canTraverse = boo;
    this.distToGoal = distToGoal;
    initialized = false;
    myProjectile = new Projectile(x*squareSize+squareSize/3+3,y*squareSize+squareSize/4);
  }
  boolean inBounds() {
    return !(x < 0 || y < 0 || x > goalX || y > goalY) && canTraverse;
  }
  boolean canTraverse() {
    return get(x, y) == color(0, 255, 0);
  }
  float[] nextMove() {
    float[][] moves = new float[][]{{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    int ind = -1;
    int low = 1000000;
    Square a;
    for (int i = 0; i < moves.length; i++) {
      try {
        a = map.get(x+(int)(moves[i][0]), y+(int)(moves[i][1]));
        if (a.inBounds() && a.canTraverse && (ind == -1 || a.distToGoal < low)) {
          ind = i;
          low = a.distToGoal;
        }
      }
      catch (IndexOutOfBoundsException e) {
      }
    }
    return moves[ind];
  }
  void mouse() {
    boolean b = !(x == goalX && y == goalY);
    for (Square[] a : map.squares) {
      for (Square s : a) {
//<<<<<<< HEAD
        //if (!(x == startX && y == startY) && b && mousePressed && mouseX < 1050) map.squares[y][x].canTraverse = false;
//=======
        if (!(x == startX && y == startY) && b && mousePressed && mouseX < 1050) {
          map.get(x,y).canTraverse = false;
          //towers.add(this);    
          myProjectile.fireMillis = millis();
        }
//>>>>>>> 9874ad50050b34b5133a1d67cbb8b39646d4e841
        if (b && mousePressed && s.canTraverse) {
          s.initialized = false;
          s.distToGoal = 0;
        }
        else if (!s.canTraverse) {
          s.distToGoal = 100000;
          //rect(x * 30, y * 30, 30, 30, 10);
        }
      }
    }
    map.setAllDist();
  }
  String toString() {
    return "(" + x + "," + y + "): " + distToGoal;
  }
}