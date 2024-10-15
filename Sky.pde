// ColorTransition Class
class Sky {
  color day, night;
  float rateChange;
  boolean isTransitioning;

  // Constructor
  Sky(color day, color night) {
    startColor = startColor;
    this.endColor = endColor;
    this.rateChange = 0.0;
    this.isTransitioning = false;
  }

  // Start the transition
  void start() {
    rateChange = 0.0;
    isTransitioning = true;
  }

  // Update the transition
  void update() {
    if (isTransitioning) {
      // Increment the rateChange gradually
      rateChange += 0.01;
      if (rateChange >= 1.0) {
        rateChange = 1.0; // Cap at 1.0
        isTransitioning = false; // Stop the transition when complete
      }
    }
  }

  // Display the current background color
  void display() {
    color intermediate = lerpColor(day, night, rateChange);
    background(intermediate);
  }

  // Check if the transition is still active
  boolean isActive() {
    return isTransitioning;
  }
}
