ArrayList<Box> sponge;
float a = 0;
void setup() {
  size(400, 400, P3D);
  Box b = new Box(0, 0, 0, 200);
  sponge = new ArrayList<Box>();
  sponge.add(b);
}

void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}

void draw () {
  background(51);
  lights();
  noStroke();
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.7);
  rotateZ(a*0.4);
  for (Box b : sponge) {
    b.show();
  }
  a += 0.01;
}