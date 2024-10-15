Sky sky;
EventHandler eh = new EventHandler();
void setup() {
  size(800, 800);
  sky = new Sky();
}

void draw() {
  sky.update();
  sky.display();
}

void mousePressed() {
  eh.updatePositions();
}
