PVector pos, vel, acc;
int count, lifespan = 10000;
DNA dna;

class Rocket {
  
  Rocket() {
    pos = new PVector(width/2, height-100);
    vel = new PVector();
    acc = new PVector();
    
    dna = new DNA(lifespan);
    count = 0;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    if (count < lifespan) {
      applyForce(dna.genes[count]);
      count++;
    }
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    pushMatrix();
    noStroke();
    fill(255, 150);
    translate(pos.x, pos.y);
    rotate(vel.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    popMatrix();
  }
}