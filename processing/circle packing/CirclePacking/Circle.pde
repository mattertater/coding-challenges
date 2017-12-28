class Circle {
  float x, y, r;
  boolean growing = true;
  float red, green, blue;
  
  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 2;
    red = random(255);
    green = random(255);
    blue = random(255);
  }
  
  void grow() {
    if (growing) {
      r = r + 0.75;
    }
  }
  
  boolean edges() {
    return ((x + r) > width || (x - r) < 0 || (y + r) > height || (y - r) < 0);
  }
  
  void show() {
    stroke(red, green, blue);
    strokeWeight(1);
    noFill();
    ellipse(x, y, r*2, r*2);
  }
}