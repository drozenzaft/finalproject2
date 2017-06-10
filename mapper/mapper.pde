int lives;
int enemiesSpawned;
int score;
<<<<<<< HEAD
int squareSize;
=======
>>>>>>> steven
int startX, startY, currentX, currentY, goalX, goalY;
ArrayList<Enemy> enemies;
Map map;
int setupMillis;

void setup() {
<<<<<<< HEAD
  size(1050, 700);
  background(255);
  squareSize = 30;
=======
  size(1050, 850);
  background(255);
>>>>>>> steven
  currentX = 0;
  currentY = 1;
  startX = 0;
  startY = 2;
<<<<<<< HEAD
  goalX = width/squareSize-1;
  goalY = height/squareSize-1;
  map = new Map();
  print("mapper");
  map.setAllDist();
=======
  goalX = width/50-1;
  goalY = 13;
  map = new Map();
>>>>>>> steven
  lives = 100;
  score = 0;
  enemies = new ArrayList<Enemy>();
  setupMillis = millis();
}

boolean shouldSpawn() {
  //the code in first comment on the following forum post helped me understand the concept of time intervals.
  //i modified it to suit this project.
  //https://forum.processing.org/one/topic/make-something-appear-on-a-time-interval.html
<<<<<<< HEAD
  if (millis() >= setupMillis + 1000) {
=======
  if (millis() > setupMillis + 1000) {
>>>>>>> steven
    setupMillis = millis();
    //spawns 20 enemies
    return enemiesSpawned < 20;
  }
  return false;
}

<<<<<<< HEAD
void mouseClicked() {
  //for (Square[] a : map.squares) {
   // for (Square s : a) {
    //  if (s.x == (int)(mouseX/50) && s.y == (int)(mouseY/50)) s.mouse();
    //}
 // }
  new Square((int)(mouseX/squareSize),(int)(mouseY/squareSize)).mouse();
}

void draw() {
  map.display();
  if (mousePressed) mouseClicked();
  //System.out.println(millis() + ", " + enemiesSpawned);
=======
void draw() {
  map.display();
  System.out.println(millis() + ", " + enemiesSpawned);
>>>>>>> steven
  if (shouldSpawn()) {
    enemies.add(new Enemy());
    enemiesSpawned++;
  }
  for (int i = 0; i < enemies.size(); i++) {
    //if (i%5 == 0) enemies.get(i).hp = 1;
    if (enemies.get(i).killed()) {
      enemies.remove(i);
      score += 10;
<<<<<<< HEAD
    } else {
=======
    } 
    else {
>>>>>>> steven
      enemies.get(i).display();
      enemies.get(i).move();
    }
    if (enemies.get(i).dead) {
      enemies.remove(i);
      i--;
    }
  }
  if (lives <= 0) {
    noLoop();
    textSize(width/12);
    textAlign(CENTER, BOTTOM);
<<<<<<< HEAD
    fill(255, 0, 0);
=======
    fill(255,0,0);
>>>>>>> steven
    text("GAME OVER\nFINAL SCORE:\n"+score, width/2, height/2);
  }
}