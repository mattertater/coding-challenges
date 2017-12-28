class Circle {
  float x, y, r;
  boolean growing = true;
  boolean ornament = false;
  boolean light = false;
  float red, green, blue;
  
  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 1;
    
    if(round(random(3)) == 0) {
      ornament = true;
      green = 0;
      if(round(random(1)) == 0) {
        red = random(255/2)+255/2;
        blue = 0;
      } else {
        red = 0;
        blue = random(255/2)+255/2;
      }
    }
    else {
      if(round(random(5)) == 0) 
        light = true;
      red = 0;
      green = random(255/2)+255/2;
      blue = 0;
    }
  }
  
  void grow() {
    if (growing) {
      if (ornament)
        r = r + 1.25;
      else if (light)
        r = 2;
      else
        r = r + 0.5;
    }
  }
  
  boolean edges() {
    return ((x + r) > width || (x - r) < 0 || (y + r) > height || (y - r) < 0);
  }
  
  void show() {
    stroke(red, green, blue);
    if (ornament) 
      fill(red, green, blue);
    else if (light) {
      float a = random(200)+55;
      stroke(a, a, a);
      fill(a, a, a);
    } else 
      noFill();
    ellipse(x, y, r*2, r*2);
  }
}