class DNA {
  PVector genes[];
  
  DNA(int lifespan) {
    genes = new PVector[lifespan];
    for (int i = 0; i < lifespan; i++) {
      genes[i] = PVector.random2D();
      genes[i].setMag(0.01);
    }
  }
}