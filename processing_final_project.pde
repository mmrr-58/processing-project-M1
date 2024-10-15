Sky sky;

void setup() {
  size(800, 800);
  sky = new Sky();
}

void draw() {
  sky.update();
  sky.display();
}

void mousePressed() {
    sky.start();
}
