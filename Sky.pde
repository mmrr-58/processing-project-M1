class Sky {
  color day, night;
  float rateChange;
  boolean isTransitioning;
  boolean isDay;

  Sky() {
    day = color(#0471b0);
    night = color(#190036);
    rateChange = 0.0;
    isTransitioning = false;
    isDay = true;
  }

  // Start the transition
  void change() {
    isTransitioning = true;
  }

  void update() {
    if (isTransitioning) {
      if (isDay) {
        rateChange += 0.01; // Day to night
        if (rateChange >= 1.0) {
          rateChange = 1.0;
          isTransitioning = false;
          isDay = false;
        }
      } else {
        rateChange -= 0.01; // Night to day 
        if (rateChange <= 0.0) {
          rateChange = 0.0;
          isTransitioning = false;
          isDay = true;
        }
      }
    }
  }

  void display() {
    color intermediate = lerpColor(day, night, rateChange);
    background(intermediate);
  }
}
