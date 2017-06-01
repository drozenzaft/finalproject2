class Enemy {
  int hp;
  color c;
  float size;
  boolean dead;
  Square current;
  Enemy() {
    hp = 5;
    c = color(0);
    current = new Square(currentX, currentY);
    size = 15;
  }
  boolean dead() {
    return hp <= 0;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(current.x()*50+25, current.y()*50+25, size, size);
  }
  ArrayList<Square> getNeighbors() {
    Square a;
    ArrayList<Square> ans = new ArrayList<Square>();
    int[][] neighbors = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    for (int[] i : neighbors) {
      a = new Square(current.x+i[0], current.y+i[1]);
      if (inBounds(a)) {
        ans.add(new Square(a.x-current.x,a.y-current.y));
      }
    }
    return ans;
  }

  boolean inBounds(Square x) {
    return x.x() > 0 && x.x() < width/50 && x.y() > 0 && x.y() < height/50;
  }

  void move() {
    if (current.x > goalX && current.y == goalY) {
      lives--;
      dead = true;
    }
    System.out.println(new Square(current.x+(int)(current.nextMove()[0]*4),current.y+(int)(current.nextMove()[1]*4)));
    current.x += current.nextMove()[0];
    current.y += current.nextMove()[1];    
  }

  /*boolean reachGoal() {
    FrontierPriorityQueue frontier = new FrontierPriorityQueue(true);
    frontier.add(current);
    while (frontier.size() > 0) {
      current = frontier.next();
      System.out.println(current);
      if (current.num() == 0) {
        lives--;
        dead = true;
        return true;
      }
      for (Square n : getNeighbors()) frontier.add(n);
    }
    return false;
  }*/
}