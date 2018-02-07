int[][] grid;
int x, y;
int dir;

int ANTUP = 0;
int ANTRIGHT = 1;
int ANTDOWN = 2;
int ANTLEFT = 3;

PImage ant;

void setup() {
  size(400, 400);
  grid = new int[width][height];
  ant = createImage(width,height,RGB);
  ant.loadPixels();
  for (int i = 0; i  < ant.pixels.length; i++) {
    ant.pixels[i] = color(255);
  }
  ant.updatePixels();
  x = 200;
  y = 200;
  dir = ANTUP;
}

void turnRight() {
  dir++;
  dir %= 4;
}

void turnLeft() {
  dir--;
  dir %= 4;  
}

void moveForward() {
  
  switch(dir) {
    case 0:{  y--; break;}
    case 1:{  x++; break;}
    case 2:{  y++; break;}
    case 3:{  x--; break;}
  }
  
  x %= width + 1;
  y %= height + 1;
}

void draw() {
  background(255);
  
  
  int state = grid[x][y];
  
  if (state == 0) {
    turnRight();
    grid[x][y] = 1;
  }
  else {
    turnLeft();
    grid[x][y] = 0;
  }
  
  color col = color(255);
  if (grid[x][y] == 1) {
    col = color(0);
  }
  
  ant.set(x,y,col);
  moveForward();
  image(ant,0,0);
}