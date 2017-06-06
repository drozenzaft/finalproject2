class Enemy {
  int hp;
  color c;
  float size;
  boolean dead;
  PVector position;
  float speed;
  Enemy() {
    hp = 5;
    c = color(0);
    speed = 2;
    position = new PVector(startX*50,startY*50);
    size = 24;
  }
  boolean killed() {
    return hp <= 0;
  }
  void display() {
    fill(c);
    stroke(c);
    ellipse(position.x+25, position.y+25, size, size);
    if (hp > 3) fill(0,255,0);
    else if (hp == 3) fill(255,255,0);
    else fill(255,0,0);
    text(""+hp,position.x+25-size/7,position.y+25+size/4);
  }
  void move() {
    if (position.x/50 == goalX && goalY == (int)(position.y/50)) {
      lives--;
      dead = true;
    }
    float[] a = gps().nextMove();
    position.add(new PVector(a[0]*speed,a[1]*speed));;
  } 
  Square gps() {
    return map.get((int)(position.x/50), (int)(position.y/50));
  }
}