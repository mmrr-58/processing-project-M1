class Sky {
  color day, night;
  float rateChange;
  boolean isTransitioning;
  boolean isDay;
  float rotation;
  int sizeX, sizeY;


  Sky(int sizeX, int sizeY) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    day = color(#0471b0);
    night = color(#190036);
    rateChange = 0.0;
    isTransitioning = false;
    isDay = true;
    rotation = 0;
  }

  // Start the transition
  void change() {
    isTransitioning = true;
  }

  boolean update() {
    if (isTransitioning) {
      // Handle day/night transition and rotation together
      float transitionSpeed = 0.01;
      if (isDay) {
        rateChange += transitionSpeed; // Day to night
        if (rateChange >= 1.0) {
          rateChange = 1.0;
          isDay = false;
          isTransitioning = false; // Stop transitioning at the end
        }
      } else {
        rateChange -= transitionSpeed; // Night to day
        if (rateChange <= 0.0) {
          rateChange = 0.0;
          isDay = true;
          isTransitioning = false; // Stop transitioning at the end
        }
      }
      rotation = rateChange * PI;
    }
    return isDay;
  }

  void display() {
    color intermediate = lerpColor(day, night, rateChange);
    background(intermediate);
    drawSunAndMoon();
  }

  void drawSunAndMoon() {
    // Rotate around the center
    pushMatrix();
    translate(sizeX/2, sizeY/2);
    rotate(rotation);
    // Draw the sun
    noStroke();
    fill(#fffec7);
    ellipse(400, -250, 100, 100);
    fill(#fffec7, 15);
    ellipse(400, -250, 300, 300);
    // Draw the moon
    noStroke();
    fill(#f5f5f5);
    ellipse(-400, 250, 100, 100);
    fill(#f5f5f5, 10);
    ellipse(-400, 250, 150, 150);
    popMatrix();
  }
}
