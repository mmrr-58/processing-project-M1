class EventHandler {
  Sky sky;
  Door door;
  Facade facade;
  Lights lights;
  Tree tree;
  Pebble[] pebbles;  // Array to hold multiple pebbles

  boolean isDay;  // Track whether it's day or night

  EventHandler(int sizeX, int sizeY) {
    sky = new Sky(sizeX, sizeY);  // Initialize the sky
    door = new Door(((sizeX / 10) * 4) + 30, sizeY - 310, ((sizeX / 10) * 6) - 30, sizeY - 310, ((sizeX / 10) * 6) - 30, 555, ((sizeX / 10) * 4) + 30, 555);
    facade = new Facade(sizeX, sizeY); // Initialize the Facade
    lights = new Lights(sizeX, sizeY); // Initialize the lights
    tree = new Tree((sizeX / 10) * 9, 650);  // Initialize tree position

    // Initialize pebbles
    int numPebbles = 3000;
    pebbles = new Pebble[numPebbles];
    for (int i = 0; i < numPebbles; i++) {
      float x = random(sizeX);                 // Random X position across the width
      float y = random(sizeY - 97, sizeY);    // Random Y position towards the bottom
      float grayValue = random(50, 150);       // Random grayscale value for pebbles
      color pebbleColor = color(grayValue, grayValue, grayValue);  // Grayscale color
      float scale = random(0.5, 1.5);          // Random scale for different sizes
      pebbles[i] = new Pebble(x, y, pebbleColor, scale);
    }
  }

  void display() {
    isDay = sky.update();  // Update sky and check if it's day
    sky.display();         // Display the sky
    facade.display();      // Display the facade
    door.display();        // Display the door
    lights.display();      // Display the lights

    // Display each pebble
    for (Pebble pebble : pebbles) {
      pebble.display();
    }

    tree.display();        // Display the tree
  }

  void triggerSky() {
    sky.change();  // Trigger sky change
    door.closed(); // Close the door if it's nighttime
    lights.toggleOff(); // Turn the lights off if it is daytime
    tree.grow();   // Trigger the tree's growth on day/night
  }

  void triggerDoor() {
    if (isDay) {
      door.open();  // Open the door if it's daytime
    }
  }

  void toggleLights() {
    if (!isDay) {
      lights.toggle(); // Toggle the lights when it is nighttime
    }
  }
}
