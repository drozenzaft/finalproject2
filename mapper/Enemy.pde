class Enemy {
  int hp;
  color c;
  float size;
  boolean dead;
  PVector position;
  float speed;
  Enemy(int maxHP, float speed) {
    hp = maxHP;
    c = color(0);
    this.speed = speed;
    position = new PVector(startX*squareSize,startY*squareSize);
    size = 24;
    dead = false;
  }
  boolean killed() {
    return hp <= 0;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(position.x+squareSize/2, position.y+squareSize/2, size, size);
    //if (hp > 3) fill(0,255,0);
    //else if (hp == 3) fill(255,255,0);
    if (hp > 3) fill(0,255,0);
    else if (hp == 3) fill(255,255,0);
    else fill(255,0,0);
    textSize(12);
    text(""+hp,position.x+squareSize/2-size/7,position.y+squareSize/2+size/4);
  }
  void move() {
    Square g = gps();
    if (g.x == goalX && g.y == goalY) {
      side.decreaseLives(hp);
      dead = true;
    }
    float[] a = g.nextMove();
    position.add(new PVector(a[0]*speed,a[1]*speed));;
  } 
  Square gps() {
    return map.get((int)(position.x/squareSize), (int)(position.y/squareSize));
  }
}