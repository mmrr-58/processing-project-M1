//  The Event Handler class creates most other classes in the drawing, so that they may interact with each other. 
//  The main methods include displaying every other class, triggering the sky and door animation, 
//  and toggling the lights on and off.


class EventHandler {
  Sky sky;
  Door door;
  Facade facade;
  Lights lights;
  Tree tree;
  Bike bike1, bike2;
  Pebble[] pebbles;

  boolean isDay;
  boolean isBike2Moving = false;

  EventHandler(int sizeX, int sizeY) {
    sky = new Sky(sizeX, sizeY);
    door = new Door(((sizeX / 10) * 4) + 30, sizeY - 310, ((sizeX / 10) * 6) - 30, sizeY - 310, ((sizeX / 10) * 6) - 30, 555, ((sizeX / 10) * 4) + 30, 555);
    facade = new Facade(sizeX, sizeY);
    lights = new Lights(sizeX, sizeY);
    tree = new Tree((sizeX / 10) * 9, 650);
    bike1 = new Bike((7 * sizeX) / 9, ((4 * sizeY) / 9) - 5);  // Stationary bike
    bike2 = new Bike(-100, 600);  // Moving bike, starts off-screen

    // Initialize pebbles
    int numPebbles = 3000;
    pebbles = new Pebble[numPebbles];
    for (int i = 0; i < numPebbles; i++) {
      float x = random(sizeX);
      float y = random(sizeY - 97, sizeY);
      float grayValue = random(50, 150);
      color pebbleColor = color(grayValue, grayValue, grayValue);
      float scale = random(0.5, 1.5);
      pebbles[i] = new Pebble(x, y, pebbleColor, scale);
    }
  }

  void display() {
    isDay = sky.update();
    sky.display();
    facade.display();
    door.display();
    lights.display();
    bike1.display();  // Always display bike1 at its original position

    for (Pebble pebble : pebbles) {
      pebble.display();
    }
    tree.display();

    if (isBike2Moving) {
      bike2.moveAcrossScreen();  // Move bike2 only if triggered
    }
  }

  void triggerSky() {
    sky.change();
    door.closed();
    lights.toggleOff();
    tree.grow();
  }

  void triggerDoor() {
    if (isDay) {
      door.open();
    }
  }

  void toggleLights() {
    if (!isDay) {
      lights.toggle();
    }
  }

  void triggerBike2() {
    isBike2Moving = true;     // Start bike2 movement
    bike2.resetPosition();    // Ensure bike2 starts off-screen
  }

  void checkMouseHit(float mousePosX, float mousePosY) {
    // Expanded hitbox for bike1
    float hitboxSize = 80;  // Increase hitbox size
    if (mousePosX >= bike1.x - hitboxSize && mousePosX <= bike1.x + hitboxSize &&
      mousePosY >= bike1.y - hitboxSize && mousePosY <= bike1.y + hitboxSize) {
      triggerBike2();  // Trigger bike2 movement if bike1 is clicked
    }
  }
}
