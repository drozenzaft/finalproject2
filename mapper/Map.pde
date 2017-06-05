class Map {
  Square[][] squares;
  Map() {
    squares = new Square[height/50][width/50];
    for (int i = 0; i < squares.length; i++) {
      for (int j = 0; j < squares[i].length; j++) {
        if (j == goalX && i == goalY) squares[i][j] = new Square(j,i,true,0);
        else squares[i][j] = new Square(j,i,true);
      }
    }
    display();
  }
  int display() {
    int start = millis();
    fill(17,6,188);
    stroke(0);
    int xcor = 0;
    int ycor = 0;
    for (Square[] sa : squares) {
      for (Square s : sa) {
        if (xcor == goalX*50 && ycor == goalY*50 || xcor == startX*50 && ycor == startY*50) fill(255,0,0);
        else if (!s.canTraverse) fill(0,255,0);
        else fill(17,6,188);
        rect(xcor, ycor, 50, 50);
        fill(255);
        text(""+s.num(), xcor+25, ycor+25);
        fill(17,6,188);
        xcor += 50;
      }
      ycor += 50;
      xcor = 0;
    }
    return millis() - start;
  }
  Square get(int x, int y) {
    return squares[x][y];
  }
}