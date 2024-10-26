class Door {
  PVector topLeft, topRight, bottomRight, bottomLeft;
  boolean isOpening = false;

  Door(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    // Initialize the door's corners with the provided coordinates
    topLeft = new PVector(x1, y1);
    topRight = new PVector(x2, y2);
    bottomRight = new PVector(x3, y3);
    bottomLeft = new PVector(x4, y4);
  }

  void display() {
    fill(200, 150, 50);  // Door color (adjust as needed)
    noStroke();
    quad(topLeft.x, topLeft.y, topRight.x, topRight.y, bottomRight.x, bottomRight.y, bottomLeft.x, bottomLeft.y);

    if (isOpening) {
      animateOpening();
    }
  }

  void open() {
    isOpening = true;
  }

  void animateOpening() {
    // Move topRight and bottomRight corners left and adjust y for perspective
    if (topRight.x > topLeft.x + 30) {  // Increase this value to reduce how much the door opens
      topRight.x -= 2;                  // Move right side corners to the left
      bottomRight.x -= 2;

      topRight.y += 0.5;                // Adjust y for perspective
      bottomRight.y -= 0.5;
    } else {
      isOpening = false;  // Stop the animation when it reaches the limit
    }
  }
}
