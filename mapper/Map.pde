class Map {
  Square[][] squares;
  Map() {
    squares = new Square[width/50][height/50];
    for (int i = 0; i < squares.length; i++) {
      for (int j = 0; j < squares[i].length; j++) {
        squares[i][j] = new Square(i,j);
      }
    }
    display();
  }
  void display() {
    fill(17,6,188);
    stroke(0);
    int xcor = 0;
    int ycor = 0;
    for (Square[] sa : squares) {
      for (Square s : sa) {
        rect(xcor, ycor, 50, 50);
        xcor += 50;
        ycor += 50;
      }
    }
  }
  Square get(int x, int y) {
    return squares[x][y];
  }
  /*void display() {
    fill(191);
    stroke(191);
    rect(50, 25, 200, 50);//top left horiz
    rect(width-250, 25, 200, 50); //top right horiz
    rect(50, height-75, 200, 50);//bottom left horiz
    rect(width-250, height-75, 200, 50); //bottom right horiz
    rect(50, 25, 75, 200);//top left vertical
    rect(width-125, 25, 75, 200); //top right vertical
    rect(50, height-250, 75, 200); //bottom left vertical
    rect(width-125, height-250, 75, 200);//bottom right vertical
  }*/
}