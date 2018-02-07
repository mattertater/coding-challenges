class Pyramid {
  PVector pos;
  float r;
  
  // constructor, making a new pyramid
  Pyramid(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }
  
  // function to generate new pyramids
  ArrayList<Pyramid> generate() {
    ArrayList<Pyramid> pyramids = new ArrayList<Pyramid>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          float newR = r / 2;
          float newX = pos.x + x * newR;
          float newY = pos.y + y * newR;
          float newZ = pos.z + z * newR;
          Pyramid b = new Pyramid(newX, newY, newZ, newR);
          pyramids.add(b);
        }
      }
    }
    return pyramids;
  }
  
  // function to display the pyramids
  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255);
    box(r);
    popMatrix();
  }
}