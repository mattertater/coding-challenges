ArrayList<Pyramid> sponge;
float a = 0;
void setup() {
  size(1000, 1000, P3D);
  Pyramid b = new Pyramid(0, 0, 0, 400);
  sponge = new ArrayList<Pyramid>();
  sponge.add(b);
}

void mousePressed() {
  ArrayList<Pyramid> next = new ArrayList<Pyramid>();
  for (Pyramid b : sponge) {
    ArrayList<Pyramid> newPyramids = b.generate();
    next.addAll(newPyramids);
  }
  sponge = next;
}

void draw () {
  background(51);
  lights();
  stroke(255);
  translate(width / 4, height / 4 + height / 2);
  rotateX(a*0.6);
  rotateY(a*0.4);
  rotateZ(a*0.2);
  for (Pyramid b : sponge) {
    b.show();
  }
  a += 0.01;
}