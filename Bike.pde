class Bike {
  float x, y;
  int[] bikeColor;

  Bike(float x, float y) {
    this.x = x;
    this.y = y;
    int[][] c = {{196, 10, 10}, {10, 97, 196}, {41, 41, 41}};
    bikeColor = c[int(random(1, 3))];
  }

  void display() {
    pushMatrix();
    translate(x, y);
    scale(0.8);

    // Wheels
    stroke(0);
    strokeWeight(5);
    fill(#c9c9c9, 50);
    ellipse(-100, 0, 100, 100);
    ellipse(100, 0, 100, 100);

    // Frame
    stroke(bikeColor[0], bikeColor[1], bikeColor[2]);
    strokeWeight(5);
    line(-100, 0, -30, -50);
    line(-30, -50, 0, 10);
    line(0, 10, -100, 0);
    line(0, 10, 90, -70);
    line(90, -70, -30, -50);
    line(90, -70, 100, 0);
    line(90, -70, 90, -90);

    // Handles and seat
    noFill();
    stroke(0);
    bezier(90, -90, 80, -95, 95, -110, 50, -90);
    line(-30, -50, -40, -70);
    stroke(#944f16);
    strokeWeight(5);
    line(-50, -70, -20, -70);
    popMatrix();
  }

  // Method to move the bike across the screen
  void moveAcrossScreen() {
    x += 5;  // Move to the right
    display();
    if (x > 1300) {  // Stop if bike2 reaches the screen edge
      x = -100;       // Reset to starting position off-screen
      events.isBike2Moving = false;  // Stop further movement until clicked again
    }
  }

  // Reset bike position for future animations
  void resetPosition() {
    x = -100;  // Start from the left of the screen
  }
}
