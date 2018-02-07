ArrayList<Pyramid> sponge;
float a = 0;
void setup() {
  size(400, 400, P3D);
  Pyramid b = new Pyramid(0, 0, 0, 200);
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
  noStroke();
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.7);
  rotateZ(a*0.4);
  for (Pyramid b : sponge) {
    b.show();
  }
  a += 0.01;
}