import java.util.Arrays;
class Enemy {
  int hp;
  color c;
  float size;
  boolean dead;
  PVector position,velocity;
  float speed;
  Enemy() {
    hp = 5;
    c = color(0);
    speed = 10;
    position = new PVector(startX*50,startY*50);
    size = 15;
  }
  boolean killed() {
    return hp <= 0;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(position.x+25, position.y+25, size, size);
  }
  /*ArrayList<Square> getNeighbors() {
    Square a;
    ArrayList<Square> ans = new ArrayList<Square>();
    int[][] neighbors = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    for (int[] i : neighbors) {
      a = new Square(position.x+i[0], position.y+i[1]);
      if (a.inBounds()) {
        ans.add(new Square(a.x-position.x,a.y-position.y));
      }
    }
    return ans;
  }*/

  void move() {
    System.out.println("("+position.x+", "+position.y+"), "+"("+position.x/50+", "+position.y/50+")");
    if (position.x/50 == goalX && goalY == (int)(position.y/50)) {
      lives--;
      dead = true;
    }
    float[] a = gps().nextMove();
    velocity = new PVector(a[0],a[1]);
    position.add(new PVector(a[0]*speed,a[1]*speed));;
    System.out.println(Arrays.toString(a)+": "+gps());
  }
  
  Square gps() {
    return map.get((int)(position.x/50), (int)(position.y/50));
  }

  /*boolean reachGoal() {
    FrontierPriorityQueue frontier = new FrontierPriorityQueue(true);
    frontier.add(position);
    while (frontier.size() > 0) {
      position = frontier.next();
      System.out.println(position);
      if (position.num() == 0) {
        lives--;
        dead = true;
        return true;
      }
      for (Square n : getNeighbors()) frontier.add(n);
    }
    return false;
  }*/
}