Population pop;
PVector target;

void setup() {
  size(400, 300);
  pop = new Population(25);
  target = new PVector(width/2, 50);
}

void draw() {
  background(0);
  ellipse(target.x, target.y, 16, 16);
  pop.run();
  
}