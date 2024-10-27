class Door {
  PVector topLeft, topRight, bottomRight, bottomLeft;
  PVector initialTopRight, initialBottomRight; 
  boolean isOpening = false;
  boolean isClosing = false;

  Door(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    // Initialize the door's corners with the provided coordinates
    topLeft = new PVector(x1, y1);
    topRight = new PVector(x2, y2);
    bottomRight = new PVector(x3, y3);
    bottomLeft = new PVector(x4, y4);
    
    // Store initial positions for precise resetting
    initialTopRight = topRight.copy();
    initialBottomRight = bottomRight.copy();
  }

  void display() {
    fill(#554011);  // Door color
    noStroke();
    quad(topLeft.x, topLeft.y, topRight.x, topRight.y, bottomRight.x, bottomRight.y, bottomLeft.x, bottomLeft.y);  // Draw door

    // Draw window on the door
    drawWindow();

    // Animate the door if it's opening or closing
    if (isOpening) {
      animateOpening();
    } else if (isClosing) {
      animateClosing();
    }
  }

  void open() {
    isOpening = true;
    isClosing = false;
  }

  void closed() {
    isClosing = true;
    isOpening = false;
  }

  void animateOpening() {
    if (topRight.x > topLeft.x + 30) {  // Opening limit
      topRight.x -= 2;                  // Move right side corners to the left
      bottomRight.x -= 2;

      topRight.y += 0.5;                // Adjust y for perspective
      bottomRight.y -= 0.5;
    } else {
      isOpening = false;  // Stop the animation when it reaches the limit
    }
  }

  void animateClosing() {
    if (topRight.x < initialTopRight.x - 2) { 
      topRight.x += 2;                  
      bottomRight.x += 2;

      topRight.y -= 0.5;                
      bottomRight.y += 0.5;
    } else {
      // Reset to ensure original coordinates
      topRight.set(initialTopRight);
      bottomRight.set(initialBottomRight);
      isClosing = false;  // Stop the animation when it reaches the original position
    }
  }

  void drawWindow() {
    // Calculate window corners based on the current door coordinates
    PVector windowTopLeft = PVector.lerp(topLeft, topRight, 0.35).lerp(bottomLeft,0.2);
    PVector windowTopRight = PVector.lerp(topLeft, topRight, 0.65).lerp(bottomLeft, 0.2);
    PVector windowBottomRight = PVector.lerp(bottomLeft, bottomRight, 0.65).lerp(topLeft, 0.2);
    PVector windowBottomLeft = PVector.lerp(bottomLeft, bottomRight, 0.35).lerp(topLeft, 0.2);

    // Draw the window quad on the door
    fill(150, 150, 150, 200);  // Window color 
    quad(windowTopLeft.x, windowTopLeft.y, 
         windowTopRight.x, windowTopRight.y, 
         windowBottomRight.x, windowBottomRight.y, 
         windowBottomLeft.x, windowBottomLeft.y);
  }
}
