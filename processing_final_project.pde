Sky sky;

void setup() {
  size(800, 600);
  sky = new Sky(#0471b0, #190036);
}

void draw() {
  // Update and display the color transition
  sky.update();
  sky.display();
}

void mousePressed() {
  if (!sky.isActive()) {
    sky.start();
  }
}
