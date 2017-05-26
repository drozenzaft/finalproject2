void setup() {
  size(1024, 700);
  background(255);
}

void setMap() {
  rect(50, 25, 200, 50);//top left horiz
  rect(width-250, 25, 200, 50); //top right horiz
  rect(50, height-75, 200, 50);//bottom left horiz
  rect(width-250, height-75, 200, 50); //bottom right horiz
  rect(50, 25, 75, 200);//top left vertical
  rect(width-125, 25, 75, 200); //top right vertical
  rect(50, height-250, 75, 200); //bottom left vertical
  rect(width-125, height-250, 75, 200);//bottom right vertical
  fill(191);
  stroke(191);
}

void draw() {
  setMap();
  //spawnEnemies();
}