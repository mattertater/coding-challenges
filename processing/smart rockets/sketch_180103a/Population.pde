class Population {
int popSize;
Rocket rockets[];

  Population(int popSize_) {
    popSize = popSize_;
    rockets = new Rocket[popSize];

    for (int i = 0; i < popSize; i++) {
      rockets[i] = new Rocket();
    }
  }
  
  void run() {
    for (int i = 0; i < popSize; i++) {
      rockets[i].update();
      rockets[i].show();
    }
  }
}