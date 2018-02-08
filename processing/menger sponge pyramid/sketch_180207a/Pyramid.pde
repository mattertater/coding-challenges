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
    float newR = r / 2;
    
    Pyramid a = new Pyramid(pos.x + newR, pos.y, pos.z, newR);
    pyramids.add(a);
    
    Pyramid b = new Pyramid(pos.x, pos.y, pos.z + newR, newR);
    pyramids.add(b);
    
    Pyramid c = new Pyramid(pos.x + newR, pos.y, pos.z + newR, newR);
    pyramids.add(c);
    
    Pyramid d = new Pyramid(pos.x + (newR / 2), pos.y + newR, pos.z + (newR / 2), newR);
    pyramids.add(d);
    
    Pyramid e = new Pyramid(pos.x, pos.y, pos.z, newR);
    pyramids.add(e);
    
    return pyramids;
  }
  
  // draws 4 triangles with to form a square pyramid
  void drawPyramid(float r) {
    beginShape();
    
    // bottom square
    beginShape();
    fill(255);
    vertex(r, 0, 0);
    vertex(r, 0, r);
    vertex(0, 0, r);
    vertex(0, 0, 0);
    endShape();
    
    // move to top of triangle
    translate(r/2, r, r/2);
    
    // do all the other faces, which are triangles
    beginShape();
    fill(255);
    vertex(-r/2, -r, -r/2);
    vertex(r/2, -r, -r/2);
    vertex(0, 0, 0);
    endShape();
    
    beginShape();
    fill(255);
    vertex(r/2, -r, -r/2);
    vertex(r/2, -r, r/2);
    vertex(0, 0, 0);
    endShape();
    
    beginShape();
    fill(255);
    vertex(r/2, -r, r/2);
    vertex(-r/2, -r, r/2);
    vertex(0, 0, 0);
    endShape();

    beginShape();
    fill(255);
    vertex(-r/2, -r, r/2);
    vertex(-r/2, -r, -r/2);
    vertex(0, 0, 0);
    endShape();
    
  }
  
  // function to display the pyramids
  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noFill();
    drawPyramid(r);
    popMatrix();
  }
}