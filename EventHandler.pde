class EventHandler {
  Sky sky;
  Door door;
  Facade facade;
  Lights lights;
  Tree tree;



  boolean isDay;  // Track whether it's day or night

  EventHandler(int sizeX, int sizeY) {
    sky = new Sky(sizeX, sizeY);  // Initialize the sky
    door = new Door(((sizeX / 10) * 4) + 30, sizeY - 310, ((sizeX / 10) * 6) - 30, sizeY - 310, ((sizeX / 10) * 6) - 30, 555, ((sizeX / 10) * 4) + 30, 555);
    facade = new Facade(sizeX, sizeY); // Initialize the Facade
    lights = new Lights(sizeX, sizeY); // Initialize the lights
    tree = new Tree((sizeX /10) * 9, 650);  // Initialize tree position
  }


  void display() {
    isDay = sky.update();  // Update sky and check if it's day
    sky.display();         // Display the sky
    facade.display();      // Display the facade
    door.display();        // Display the door
    lights.display(); //display the lights
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
      lights.toggle(); //Toggle the lights when it is nighttime
    }
  }
}
