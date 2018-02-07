class Box {
  PVector pos;
  float r;

  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }

  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          if (abs(x)+abs(y)+abs(z) > 1) {
            float newR = r / 3;
            float newX = pos.x + x * newR;
            float newY = pos.y + y * newR;
            float newZ = pos.z + z * newR;
            Box b = new Box(newX, newY, newZ, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255);
    box(r);
    popMatrix();
  }
}