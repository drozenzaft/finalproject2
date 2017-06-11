class Map {
  Square[][] squares;
  Map() {
    squares = new Square[height/squareSize][width/squareSize];
    for (int i = 0; i < squares.length; i++) {
      for (int j = 0; j < squares[i].length; j++) {
        if (j == goalX && i == goalY) {
          squares[i][j] = new Square(j, i, true, 0);
          squares[i][j].initialized = true;
        } else {
          squares[i][j] = new Square(j, i, true, -1);
        }
      }
    }
    display();
  }
  void display() {
    fill(17, 6, 188);
    stroke(0);
    int xcor = 0;
    int ycor = 0;
    for (Square[] sa : squares) {
      for (Square s : sa) {
        if (xcor == goalX*squareSize && ycor == goalY*squareSize || xcor == startX*squareSize && ycor == startY*squareSize) fill(255, 0, 0);
        else if (!s.canTraverse) fill(0, 255, 0);
        else fill(17, 6, 188);
        rect(xcor, ycor, squareSize, squareSize);
        fill(255);
        text(""+s.distToGoal, xcor+squareSize/2, ycor+squareSize/2);
        fill(17, 6, 188);
        xcor += squareSize;
      }
      ycor += squareSize;
      xcor = 0;
    }
  }
  Square get(int x, int y) {
    return squares[y][x];
  }
  void setAllDist() {
    float[][] moves = new float[][]{{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    QueueFrontier frontier = new QueueFrontier();
    Square current = map.get(goalX, goalY);
    current.initialized = true;
    frontier.add(current);
    while (frontier.size() > 0) {
      current = frontier.next();
      for (float[] move : moves) {
        try {
          int x = current.x+(int)(move[0]);
          int y = current.y+(int)(move[1]);
          Square a = get(x, y);
          if (a.inBounds() && !a.initialized) {
            frontier.add(a);
            a.distToGoal = current.distToGoal+1;
            a.initialized = true;
          }
        }
        catch(IndexOutOfBoundsException e) {
        }
      }
    }
  }
}