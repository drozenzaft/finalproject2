/**import java.util.*;
class Map {
  Square[][] squares;
//<<<<<<< HEAD
  //SideBar side;
  //ArrayList<Tower> towers = new ArrayList<Tower>();
  //boolean placingTower;
  Map(){//SideBar sb) {
    println("initializing");
    //placingTower = false;
    //side = sb;
    squares = new Square[height/squareSize][(width - 300)/squareSize];
//=======
  Map() {
    squares = new Square[height/squareSize][width/squareSize];
>>>>>>> 9874ad50050b34b5133a1d67cbb8b39646d4e841
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
<<<<<<< HEAD
    //map.mouseClicked();
=======
    fill(0);
    textSize(squareSize*2);
    text("LIVES: " + lives,squareSize,height-squareSize/2);
    textSize(20);
>>>>>>> 9874ad50050b34b5133a1d67cbb8b39646d4e841
  }
  Square get(int x, int y) {
    return squares[y][x];
  }
  //void mouseClicked() {
    //if (mouseX >= 1060 && mouseX <= 1090 && mouseY >= 60 && mouseY <= 90) {
      //System.out.println("Square clicked in mouseClicked");
      //towers.add(new Tower());
      //if (side.getMoney().showMoney() < towers.get(towers.size() - 1).getBuy()) {
        //System.out.println("Tower too expensive in mouseClicked");
        //towers.remove(towers.size() - 1);
        //return;
      //} else {
        //placingTower = true;


        //if (placingTower) {
          //towers.get(towers.size() - 1).setCoords(mouseX, mouseY);
          //placingTower = false;
        //}
      //}

      //void placeTower() {
       if (mousePressed && mouseX >= 1060 && mouseX <= 1090 && mouseY >= 60 && mouseY <= 90) {
       //System.out.println("The Square has been clicked");
       //towers.add(new Tower ());
       //error message needed
       //if (side.getMoney().showMoney() < towers.get(towers.size() - 1).getBuy()) {
       //System.out.println("Tower too expensive");
       //towers.remove(towers.size() - 1);
       //return;
       //}
       //placingTower = true;
       //mouseClicked();
      //if (mouse) {
       //System.out.println("tower stays, coords are being set");
       //towers.get(towers.size() - 1).setCoords(mouseX, mouseY);
       //System.out.println("MouseX: " + mouseX + ", MouseY: " + mouseY);
       //}
       //}
      //for (Tower t : towers) {
        //System.out.println("displaying");
        //t.display();
      //}
    //}
  //}
  //void displayTowers() {
    //for (Tower t : towers) {
      //t.display();
    //}
  //}
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
}*/