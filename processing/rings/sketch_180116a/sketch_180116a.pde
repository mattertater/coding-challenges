// hopefully going to make a gif of going through some rings

// skeleton code gotten from processing examples page,
// https://processing.org/examples/toroid.html

int pts = 40;
float angle = 0;
float radius = 15.0;

int segments = 60;
float latheAngle = 0;
float latheRadius = 100.0;

float difference = 2000;
float initialDistance = -500;
float resetDistance = -3000;

PVector vertices[], vertices2[];

void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(58, 94, 188);
  lights();
  
  noStroke();
  fill(220, 220, 20);
  
  
  
  vertices = new PVector[pts+1];
  vertices2 = new PVector[pts+1];
  
  // fill arrays
  for (int i = 0; i <= pts; i++) {
    vertices[i] = new PVector();
    vertices2[i] = new PVector();
    vertices[i].x = latheRadius + sin(radians(angle))*radius;
    vertices[i].z = cos(radians(angle))*radius;
    angle += 360.0 / pts;
  }
  
  translate(width/2, height/2, initialDistance);
  drawToroid();
  translate(0, 0, difference);
  drawToroid();
  translate(0, 0, difference);
  drawToroid();
  
  initialDistance = distance(initialDistance);
  initialDistance += 10;
}

float distance(float dist) { 
  if (dist > 300)
    return resetDistance;
  return dist;
}

void drawToroid() {
  // draw toroid
  latheAngle = 0;
  for (int i = 0; i <= segments; i++) {
    beginShape(QUAD_STRIP);
    for (int j = 0; j <= pts; j++) {
      if (i > 0) {
        vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
      }
      vertices2[j].x = cos(radians(latheAngle))*vertices[j].x;
      vertices2[j].y = sin(radians(latheAngle))*vertices[j].x;
      vertices2[j].z = vertices[j].z;
      vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
    }
    latheAngle += 360.0 / segments;
    endShape();
  }
}