class Facade {
  int sizeX, sizeY;
  int startY = 200;

  Facade(int sizeX, int sizeY) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }

  void display() {
    noStroke();

    // Create a vertical gradient for the roof
    for (int i = startY; i < startY + 140; i++) {
      float interpolation = map(i, startY, startY + 140, 0, 1);  // Interpolation from top to bottom
      color gradientColor = lerpColor(color(#616162), color(0), interpolation);  // Lerp between gray and black

      stroke(gradientColor);  // Set stroke color for the gradient line
      line(0, i, sizeX, i);   // Draw a line across the width of the rectangle
    }
    
    fill(#000000);  //fill for back wall
    rect(0, 340, sizeX, sizeY);

    fill(#7C7C7C);  //fill for walls
    quad(0, 190, 100, 240, 100, 600, 0, 600);


    fill(#FFFFFF);  //fill for outside floor
    rect(0, sizeY-100, sizeX, 100);

    fill(#E5E5E5);  //fill for front step
    rect(0, sizeY-140, (sizeX/10)*4, 40);
    rect((sizeX/10)*6, sizeY-140, (sizeX/10)*4, 40);

    fill(#B4B4B4);  //fill for beams
    rect(0, sizeY-520, sizeX, 20);
    rect(0, sizeY-370, sizeX, 20);

    fill(#CBCBCB);  //fill for columns
    rect(0, sizeY-500, 20, 360);
    rect(sizeX-20, sizeY-500, 20, 360);
    rect(((sizeX/10)*4)-35, sizeY-520, 35, 420);
    rect((sizeX/10)*6, sizeY-520, 35, 420);
  }
}
