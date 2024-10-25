class Facade {
  int sizeX, sizeY;
  int startY = 200;

  Facade(int sizeX, int sizeY) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }

  void display() {

    // Draw the roof gradient first with new colors
    for (int i = startY; i < startY + 150; i++) {
      float interpolation = map(i, startY, startY + 150, 0, 1);  // Interpolation from top to bottom
      color gradientColor = lerpColor(color(#A2A2A2), color(#505050), interpolation);  // Lerp between light gray and dark blue

      stroke(gradientColor);  // Set stroke color for the gradient line
      noFill();
      line(0, i, sizeX, i);   // Draw a line across the width of the roof
    }

    // Left side wall gradient following the quad shape with new colors
    for (int i = 0; i < 100; i++) {
      float interX1 = lerp(0, 100, i / 100.0);     // Left x interpolation
      float interY1 = lerp(190, 240, i / 100.0);   // Left y interpolation
      float interX2 = lerp(0, 100, (i + 1) / 100.0); // Next step for x
      float interY2 = lerp(190, 240, (i + 1) / 100.0); // Next step for y
      float interpolation = map(i, 0, 100, 0, 1);  // Interpolation for color
      color gradientColor = lerpColor(color(#F7D137), color(#7C660F), interpolation);  // Gradient from light gray to dark gray
      noStroke();
      fill(gradientColor);
      quad(interX1, interY1, interX2, interY2, interX2, 600, interX1, 600);  // Gradient quad strips along the diagonal
    }

    // Right side wall gradient following the quad shape with new colors
    for (int i = 0; i < 100; i++) {
      float interX1 = lerp(sizeX, (sizeX / 10) * 6, i / 100.0);   // Right x interpolation
      float interY1 = lerp(190, 390, i / 100.0);  // Right y interpolation
      float interX2 = lerp(sizeX, (sizeX / 10) * 6, (i + 1) / 100.0); // Next step for x
      float interY2 = lerp(190, 390, (i + 1) / 100.0); // Next step for y
      float interpolation = map(i, 0, 100, 0, 1);  // Interpolation for color
      color gradientColor = lerpColor(color(#F7D137), color(#7C660F), interpolation);  // Gradient from light gray to dark gray
      noStroke();
      fill(gradientColor);
      quad(interX1, interY1, interX2, interY2, interX2, 600, interX1, 600);  // Gradient quad strips along the diagonal
    }

    noStroke();  // Ensure no stroke is applied to bottom shapes

    // Draw the bottom shapes
    fill(#FFFFFF);  // Fill for outside floor
    rect(0, sizeY - 100, sizeX, 100);

    fill(#CBCBCB);  // Fill for front step
    rect(0, sizeY - 140, (sizeX / 10) * 4, 40);
    rect((sizeX / 10) * 6, sizeY - 140, (sizeX / 10) * 4, 40);
    fill(#A2A1A1);
    quad(20, sizeY - 140,
      80, sizeY - 147,
      (sizeX / 10) * 4, sizeY - 147,
      (sizeX / 10) * 4, sizeY - 140);
    quad(sizeX - 20, sizeY - 140,
      sizeX - 80, sizeY - 147,
      sizeX - (sizeX / 10) * 4, sizeY - 147,
      sizeX - (sizeX / 10) * 4, sizeY - 140);





    fill(#CBCBCB);  // Fill for beams
    rect(0, sizeY - 520, sizeX, 20);
    rect(0, sizeY - 350, sizeX, 20);

    fill(#CBCBCB);  // Fill for columns
    rect(0, sizeY-500, 20, 360);
    rect(sizeX-20, sizeY-500, 20, 360);

    // First rectangle
    rect(((sizeX / 10) * 4) - 35, sizeY - 520, 35, 420);
    for (int y = sizeY - 520 + 35; y <= sizeY - 100 - 35; y += 35) {
      stroke(#B5B5B5); // Set stroke color to light gray
      line(((sizeX / 10) * 4) - 35, y, ((sizeX / 10) * 4)-2, y); // Draw horizontal line with adjusted length
    }

    // Second rectangle
    noStroke();
    rect((sizeX / 10) * 6, sizeY - 520, 35, 420);
    for (int y = sizeY - 520 + 35; y <= sizeY - 100 - 35; y += 35) {
      stroke(#B5B5B5); // Set stroke color to light gray
      line((sizeX / 10) * 6, y, ((sizeX / 10) * 6) + 33, y); // Draw horizontal line with adjusted length
    }
  }
}
