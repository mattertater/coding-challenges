import peasy.*;

PeasyCam cam;

// start off some variables
float a = 0;
float offset = 0;
float maxD;
int r = 0, g = 0, b = 0;
boolean redUp = true, greenUp = true, blueUp = true;

// changing these messes with the output
int w = 64; // width of rectangles. Lower number = higher resolution
int colorSpeed = 1; // how fast the colors change. lower is slower, higher is faster
float rotateSpeed = 0.5; // 1 is the base. lower number is slower, higher is faster. 

void setup() {
  // set size of window, using 3D
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, width / 2, width / 2, 0, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  maxD = dist(0, 0, width / 2, height / 2);
}

void draw() {

  if (redUp) r += 1 * colorSpeed; else r -= 1 * colorSpeed;
  if (greenUp) g += 2 * colorSpeed; else g -= 2 * colorSpeed; 
  if (blueUp) b += 3 * colorSpeed; else b -= 3 * colorSpeed;  
  
  if (r >= 240) redUp = false; else if (r <= 30) redUp = true;
  if (g >= 240) greenUp = false; else if (g <= 30) greenUp = true;
  if (b >= 240) blueUp = false; else if (b <= 30) blueUp = true;
  
  // set up the colors, angles, and lighting
  background(0);
  noStroke();
  directionalLight(r, g, b, 300, 300, 300);
  ambientLight(100, 100, 100, 600, 600, 600);
  ortho(-1000, 1000, 1000, -1000, -10000, 10000);
  translate(width / 2, height / 2);
  //rotateX(PI / 6);
  //rotateY(PI / 3);
  rotateX(a / 4 * rotateSpeed);
  rotateY(a / 5 * rotateSpeed);
  rotateZ(a / 6 * rotateSpeed);

  // update weird lighting values
  
 

  // draw the shapes and update the angle
  for (int x = 0; x < width; x += w) {
    for (int z = 0; z < height; z += w) {
      pushMatrix();
      float d = dist(x, z, width / 2, height / 2);
      offset = map(d, 0, maxD, -TWO_PI, TWO_PI);
      float h = map(sin(a + offset), -1, 1, 25, 600);
      translate(x - width / 2, 0, z - height / 2);
      box(w, h, w);
      popMatrix();
    }
  }

  // update variables and angle
  offset = 0;
  a -= 0.075;
}